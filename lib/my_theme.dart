import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static const Color blueColor = Color(0xff5D9CEC);
  static const Color ScaffoldBackgroundColor = Color(0xffDFECDB);
  static final ThemeData lightTheme = ThemeData(
    primaryColorLight: blueColor,
    scaffoldBackgroundColor: ScaffoldBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme:  IconThemeData(
          color: blueColor
      ),
    )
  );




}