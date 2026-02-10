import 'dart:ui';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get surfaceColor => const Color(0xFFfafafa);
  Color get tertiaryColor => const Color(0xFF666666);
  Color get primaryColor => const Color(0xFFFF7859);
  Color get primaryColorDark => const Color.fromARGB(255, 183, 86, 64);
  Color get secondaryColor => const Color(0xFF2281c7);
  Color get secondaryColorDark => const Color.fromARGB(255, 34, 129, 199);
  Color get dividerColor => const Color(0xFFDDDDDE);
  Color get errorColor => const Color(0xFFFF3B3B);
  Color get onSurfaceColor => const Color(0XFF1A1A1A);
  Color get successColor => const Color(0xFF06C270);
  Color get warningColor => const Color(0xFFFFCC00);
  Color get infoColor => const Color(0xFF0063F7);
  Color get atentionColor => const Color.fromARGB(255, 255, 123, 0);
  Color get contentColor => const Color(0XFF666666);
  Color get outlineColor => const Color(0XFFE5E5E5);
  Color get backgroundColor => const Color(0XFFFFFFFF);

  //Dark Theme Variants
  Color get primaryDarkColor => const Color(0xFFFF7859);
  Color get tertiaryDarkColor => const Color(0xFF666666);
  Color get onSurfaceColorDark => const Color(0XFF1A1A1A);
  Color get backgroundDarkColor => const Color(0xFF1a1a1d);
  Color get dividerColorDarkMode => const Color(0xFF414040);
  Color get surfaceDarkColor => const Color.fromARGB(255, 255, 255, 255);
  Color get outlineDarkColor => const Color(0XFF666666);
}
