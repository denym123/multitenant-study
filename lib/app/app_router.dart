import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/modules.dart';
import '../core/core.dart';
import '../global_modules/global_modules.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: SplashModule.path,
    observers: [LoggerNavigationObserver()],
    routes: [SplashModule().route],
  );

  static final List<SingleChildWidget> globalProviders = [
    ChangeNotifierProvider(create: (context) => LocaleStore()),
    Provider<LocalSecureStorage>(create: (context) => LocalSecureStorageImpl()),
    Provider(
      create: (context) =>
          HttpAdapter(localeStore: context.read<LocaleStore>()),
    ),
  ];
}
