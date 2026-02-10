import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'SIBO';

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    useMaterial3: true,
    dividerColor: AppColors.i.dividerColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.i.secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 0),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    textTheme: AppTextTheme.i.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.i.backgroundColor,
      titleTextStyle: AppTextTheme.i.textTheme.titleMedium!.copyWith(
        color: AppColors.i.onSurfaceColor,
      ),
    ),
    primaryColor: AppColors.i.primaryColor,
    scaffoldBackgroundColor: AppColors.i.backgroundColor,
    colorScheme: ColorScheme.light(
      onSurface: AppColors.i.onSurfaceColor,
      tertiary: AppColors.i.tertiaryColor,
      outline: AppColors.i.outlineColor,
      surface: AppColors.i.surfaceColor,
      secondary: AppColors.i.secondaryColor,
      brightness: Brightness.light,
      primary: AppColors.i.primaryColor,
      error: AppColors.i.errorColor,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    dividerColor: AppColors.i.dividerColor,
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.i.secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 0),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    textTheme: AppTextTheme.i.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.i.backgroundDarkColor,
      titleTextStyle: AppTextTheme.i.textTheme.titleMedium!.copyWith(
        color: AppColors.i.onSurfaceColorDark,
      ),
    ),
    scaffoldBackgroundColor: AppColors.i.backgroundDarkColor,
    primaryColor: AppColors.i.primaryDarkColor,
    colorScheme: ColorScheme.dark(
      onSurface: AppColors.i.onSurfaceColorDark,
      tertiary: AppColors.i.tertiaryDarkColor,
      outline: AppColors.i.outlineDarkColor,
      secondary: AppColors.i.secondaryColor,
      brightness: Brightness.dark,
      surface: AppColors.i.surfaceDarkColor,
      primary: AppColors.i.primaryDarkColor,
      error: AppColors.i.errorColor,
    ),
  );
}
