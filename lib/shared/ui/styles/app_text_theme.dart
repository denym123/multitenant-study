import 'package:flutter/material.dart';

class AppTextTheme {
  static AppTextTheme? _instance;
  AppTextTheme._();

  static AppTextTheme get i {
    _instance ??= AppTextTheme._();
    return _instance!;
  }

  final _fontFamily = 'Poppins';

  TextTheme get textTheme => TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
  );
}
