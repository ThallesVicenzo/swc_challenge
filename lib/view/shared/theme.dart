import 'package:flutter/material.dart';

class AppTheme {
  static get defaultTheme => ThemeData(
        splashColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFF11159A),
        highlightColor: const Color(0xFFFFBE00),
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF11159A),
            fontSize: 40,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 25,
          ),
          bodySmall: TextStyle(
            color: Color(0xFF11159A),
            fontSize: 15,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF11159A),
          centerTitle: true,
        ),
      );
}
