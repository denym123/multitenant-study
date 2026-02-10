import 'package:dio/dio.dart';

class OptionHelper {
  static Options showMessage(bool showMessage) {
    return Options(extra: {'show-message': showMessage});
  }
}
