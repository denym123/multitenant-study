import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../../global_modules/global_modules.dart';
import '../../shared/shared.dart';
import '../core.dart';

class ApplicationConfig {
  Future<void> configureApp({
    required LocalSecureStorage localSecureStorage,
    required LocaleStore localeStore,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    await _loadEnv();
    await _loadLocale(localSecureStorage, localeStore);
  }

  Future<void> _loadLocale(
    LocalSecureStorage localSecureStorage,
    LocaleStore localeStore,
  ) async {
    final savedLocaleCode = await localSecureStorage.read(LSConstants.locale);
    if (savedLocaleCode != null) {
      localeStore.setLocale(Locale(savedLocaleCode));
    } else {
      final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
      final isSupported = L10n.supportedLocales.any(
        (locale) => locale.languageCode == deviceLocale.languageCode,
      );
      if (isSupported) {
        localeStore.setLocale(Locale(deviceLocale.languageCode));
      }
    }
  }

  Future<void> _loadEnv() async {
    await Environments.loadEnv();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp();
    FirebaseCrashlytics.instance;
  }
}
