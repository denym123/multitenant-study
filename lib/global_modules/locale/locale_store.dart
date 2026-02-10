import 'package:flutter/material.dart';

class LocaleStore with ChangeNotifier {
  Locale _locale;

    LocaleStore() : _locale = const Locale('pt');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('pt');
    notifyListeners();
  }
}

class L10n {
  static const supportedLocales = [Locale('es'), Locale('pt')];
}
