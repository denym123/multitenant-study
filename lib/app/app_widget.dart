import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../core/core.dart';
import '../global_modules/global_modules.dart';
import 'app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppRouter.globalProviders,
      child: AdaptiveTheme(
        light: UiConfig.lightTheme,
        initial: AdaptiveThemeMode.light,
        dark: UiConfig.darkTheme,
        builder: (light, dark) {
          return Consumer<LocaleStore>(
            builder: (_, localeStore, __) {
              return MaterialApp.router(
                theme: light,
                darkTheme: dark,
                debugShowCheckedModeBanner: false,
                title: UiConfig.title,
                locale: localeStore.locale,
                supportedLocales: L10n.supportedLocales,
                routerConfig: AppRouter.router,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}
