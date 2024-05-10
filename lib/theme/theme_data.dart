import 'package:flutter/material.dart';

abstract class CustomThemeData {
  static const primaryColors = Color.fromARGB(255, 34, 146, 173);

//Tema Light
  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primaryColors,
      ),
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: primaryColors,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w300,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColors, selectedItemColor: Colors.white),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(primary: primaryColors),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: primaryColors,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
      ),
       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColors, selectedItemColor: Color.fromARGB(255, 3, 20, 24), unselectedItemColor: Colors.white),
    );
  }
}
