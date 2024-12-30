import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 43, 42, 42),
    primarySwatch: Colors.amber,
    dividerColor: Colors.white,
    listTileTheme: ListTileThemeData(iconColor: Colors.white),
    appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(255, 43, 42, 42),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20)),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ));
