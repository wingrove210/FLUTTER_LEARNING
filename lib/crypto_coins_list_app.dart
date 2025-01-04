import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrencyListApp extends StatelessWidget {
  const CryptoCurrencyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrencyListApp',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [
        TalkerRouteObserver(
          GetIt.I<Talker>(), 
        )
      ],
    );
  }
}