import 'dart:async';
import 'dart:developer';

import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../core.dart';

Future<void> bootstrap() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      const envString = String.fromEnvironment('ENV', defaultValue: 'dev');
      FlavorConfig.setAppFlavor(FlavorConfig.fromString(envString));

      const customerString = String.fromEnvironment(
        'CUSTOMER',
        defaultValue: 'empresaA',
      );
      CustomerConfig.setAppCustomer(CustomerConfig.fromString(customerString));

      const projectId = String.fromEnvironment('CLARITY_PROJECT_ID');
      final config = ClarityConfig(projectId: projectId);

      log(
        '🚀 Iniciando App - Customer: ${CustomerConfig.appCustomer.name}, Ambiente: ${FlavorConfig.appFlavor.name}',
      );

      runApp(ClarityWidget(app: AppWidget(), clarityConfig: config));
    },
    (error, stack) {
      log('🔴 Erro não tratado:', error: error, stackTrace: stack);
    },
  );
}
