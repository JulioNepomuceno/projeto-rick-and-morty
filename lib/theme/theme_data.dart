import 'package:flutter/material.dart';

abstract class CustomThemeData{

  static const primaryColors = Color.fromARGB(255, 34, 146, 173);


//Tema Light
static ThemeData light(){
  return ThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColors,),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: primaryColors,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),iconTheme: IconThemeData(color: Colors.red)
      )
  );
}


static ThemeData dark(){
  return ThemeData(
      colorScheme: const ColorScheme.dark(primary: primaryColors),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: primaryColors,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),iconTheme: IconThemeData(color: Colors.red)
      ),
  );
}


}