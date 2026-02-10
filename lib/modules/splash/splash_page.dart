import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import 'splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends PageLifeCycleState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
