import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff354633),
    scaffoldBackgroundColor: const Color(0xffe7e7e7),

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff354633),
    scaffoldBackgroundColor: const Color(0xff3f3f3f),
    // Add other properties as needed
  );
}