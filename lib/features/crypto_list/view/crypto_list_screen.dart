import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CtyptoListScreen extends StatefulWidget {
  const CtyptoListScreen({
    super.key,
  });

  @override
  State<CtyptoListScreen> createState() => _CtyptoListScreenState();
}

class _CtyptoListScreenState extends State<CtyptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('CryptoCurrencyListApp'),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, i) { 
            const coinName = 'Bitcoin';
            return const CryptoCoinTile(coinName: coinName);
            },
          ),
    );
  }
}