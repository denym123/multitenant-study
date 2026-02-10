import 'package:dio/dio.dart';

import '../../../global_modules/global_modules.dart';

class LocaleInterceptor extends Interceptor {
  final LocaleStore localeStore;

  LocaleInterceptor({required this.localeStore});

  @override
  void onRequest(RequestOptions options, handler) {
    options.headers['Accept-Language'] = localeStore.locale.languageCode;
    super.onRequest(options, handler);
  }
}
