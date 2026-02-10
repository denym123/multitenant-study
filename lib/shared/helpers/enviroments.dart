import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/core.dart';
import '../shared.dart';

class Environments {
  Environments._();

  static String? param(String param) {
    return FirebaseRemoteConfig.instance.getString(
      '${param.toUpperCase()}_${FlavorConfig.appFlavor.toUpperCase()}',
    );
  }

  static Future<void> loadEnv() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 5),
        minimumFetchInterval: Duration(seconds: 10),
      ),
    );
    remoteConfig.setDefaults({'BASEURL_PRD': ''});
    try {
      await remoteConfig.fetchAndActivate();
    } catch (_) {
      await remoteConfig.activate();
    }
  }
}
