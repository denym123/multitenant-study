import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../shared.dart';

abstract class PageLifeCycleState<
  P extends StatefulWidget,
  C extends ControllerLifeCycle
>
    extends State<P> {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    controller.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) controller.onReady(context);
    });
  }

  @override
  void dispose() {
    controller.onDispose();
    super.dispose();
  }
}
