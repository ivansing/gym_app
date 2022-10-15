import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Color.fromARGB(255, 58, 116, 102),
   
    primaryColorLight: Color.fromARGB(220, 57, 227, 128),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF4F4F4),

    fontFamily: 'Optima',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color.fromARGB(255, 58, 116, 102),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
