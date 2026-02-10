import '../../shared/shared.dart';

class CustomerConfig {
  static late Customer _appCustomer;

  static Customer get appCustomer => _appCustomer;

  static void setAppCustomer(Customer value) {
    _appCustomer = value;
  }

  static Customer fromString(String value) {
    return Customer.values.firstWhere(
      (c) => c.name == value,
      orElse: () => Customer.empresaA,
    );
  }
}
