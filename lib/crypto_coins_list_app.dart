import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyListApp extends StatelessWidget {
  const CryptoCurrencyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrencyListApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}