import 'package:dio/io.dart';

import '../../../global_modules/global_modules.dart';
import '../../core.dart';

class HttpAdapter extends DioForNative {
  final LocaleStore localeStore;

  HttpAdapter({required this.localeStore}) {
    _configureOptions();
    _configureInterceptors();
  }

  void _configureOptions() {
    options
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);
  }

  void _configureInterceptors() {
    interceptors.addAll([
      LoggerInterceptor(),
      LocaleInterceptor(localeStore: localeStore),
    ]);
  }
}
