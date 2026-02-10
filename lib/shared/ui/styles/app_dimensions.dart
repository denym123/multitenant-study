class AppDimensions {
  static AppDimensions? _instance;
  AppDimensions._();

  static AppDimensions get i {
    _instance ??= AppDimensions._();
    return _instance!;
  }

  // Border
  /// 1px
  double get borderSM => 1;

  /// 2px
  double get borderM => 2;

  // Spacing
  /// 2px
  double get space2XS => 2;

  /// 4px
  double get spaceXS => 4;

  /// 8px
  double get spaceS => 8;

  /// 12px
  double get spaceM => 12;

  /// 16px
  double get spaceL => 16;

  /// 24px
  double get spaceXL => 24;

  /// 32px
  double get space2XL => 32;

  /// 40px
  double get space3XL => 40;

  /// 48px
  double get space4XL => 48;

  /// 56px
  double get space5XL => 56;

  /// 64px
  double get space6XL => 64;

  /// 72px
  double get space7XL => 72;

  /// 80px
  double get space8XL => 80;

  /// 88px
  double get space9XL => 88;

  /// 96px
  double get space10XL => 96;

  /// 104px
  double get space11XL => 48;

  /// 112px
  double get space12XL => 112;

  /// 120px
  double get space13XL => 120;

  /// 144px
  double get space14XL => 144;

  // Radius
  /// 8px
  double get radiusM => 8;

  /// 12px
  double get radiusL => 12;

  /// 16px
  double get radiusXL => 16;
}
