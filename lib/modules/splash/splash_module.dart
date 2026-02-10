import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../global_modules/global_modules.dart';
import '../../shared/shared.dart';
import 'splash.dart';

class SplashModule extends ProviderModule {
  static const String path = '/';
  SplashModule()
    : super(
        path: path,
        page: const SplashPage(),
        bindings: (_) => [
          Provider(
            create: (context) => SplashController(
              localSecureStorage: context.read<LocalSecureStorage>(),
              localeStore: context.read<LocaleStore>(),
            ),
          ),
        ],
      );
}
