import 'dart:async';

import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../bloc/crypto_list_bloc.dart';

class CtyptoListScreen extends StatefulWidget {
  const CtyptoListScreen({
    super.key,
  });

  @override
  State<CtyptoListScreen> createState() => _CtyptoListScreenState();
}

class _CtyptoListScreenState extends State<CtyptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: Completer()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('CryptoCurrencyListApp'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => (TalkerScreen(talker: GetIt.I<Talker>()))));
            }, icon: Icon(Icons.document_scanner_outlined))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Something went wrong'),
                      SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList(completer: Completer())); // Повторная загрузка данных
                        },
                        child: Text('Try again'),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: const CircularProgressIndicator());
            },
          ),
        )

        // (_cryptoCoinsList == null)
        //     ? Center(child: const CircularProgressIndicator())
        );
  }
}
