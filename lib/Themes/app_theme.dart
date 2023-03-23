import 'package:flutter/material.dart';

class AppTheme {
  static const Color pallete1 = Color.fromARGB(255, 54, 26, 8);
  static const Color pallete2 = Color.fromARGB(255, 165, 132, 87);
  static const Color pallete3 = Color.fromARGB(255, 235, 230, 216);
  static const Color pallete4 = Color.fromARGB(255, 95, 51, 15);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: pallete1,
    appBarTheme: const AppBarTheme(
      color: pallete1,
      elevation: 10,
    ),
    scaffoldBackgroundColor: pallete3,
  );
}
