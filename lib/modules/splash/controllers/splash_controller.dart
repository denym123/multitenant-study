import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../global_modules/global_modules.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class SplashController with SplashVariables, ControllerLifeCycle {
  final LocalSecureStorage _localSecureStorage;
  final LocaleStore _localeStore;

  SplashController({
    required LocalSecureStorage localSecureStorage,
    required LocaleStore localeStore,
  }) : _localSecureStorage = localSecureStorage,
       _localeStore = localeStore;

  @override
  void onReady(BuildContext context) {
    super.onReady(context);
    initApp(context);
  }

  Future<void> initApp(BuildContext context) async {
    await ApplicationConfig().configureApp(
      localSecureStorage: _localSecureStorage,
      localeStore: _localeStore,
    );
    // TODO: Implementar lógica de navegação após splash
  }
}
