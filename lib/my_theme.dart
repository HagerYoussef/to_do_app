import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static const Color blueColor = Color(0xff5D9CEC);
  static const Color ScaffoldBackgroundColor = Color(0xffDFECDB);
  static const Color redColor = Color(0xffEC4B4B);
  static final ThemeData lightTheme = ThemeData(
    primaryColorLight: blueColor,
    scaffoldBackgroundColor: ScaffoldBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme:  IconThemeData(
          color: blueColor
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black
      ),
        titleMedium: TextStyle(
            fontSize: 22,
            color: blueColor,
          fontWeight: FontWeight.bold
        ),
        titleSmall: TextStyle(
            fontSize: 24,
            color: blueColor,
            fontWeight: FontWeight.bold
        ),
        bodyMedium: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
        )
    )
  );




}