import '../../shared/shared.dart';

class FlavorConfig {
  static late Flavor _appFlavor;

  static Flavor get appFlavor => _appFlavor;

  static void setAppFlavor(Flavor value) {
    _appFlavor = value;
  }

  static Flavor fromString(String value) {
    return Flavor.values.firstWhere(
      (f) => f.name == value,
      orElse: () => Flavor.dev,
    );
  }
}
