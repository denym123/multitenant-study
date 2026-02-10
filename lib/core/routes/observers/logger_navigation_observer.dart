import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class LoggerNavigationObserver extends NavigatorObserver {
  // Chamado quando uma nova rota é empurrada (Push)
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logRoute('➡️ Entrou na rota (Push)', route);
  }

  // Chamado quando a rota é removida/morta (Pop)
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logRoute('💀 Saiu da rota (Pop/Morta)', route);
  }

  // Opcional: Chamado quando uma rota substitui outra (Replacement)
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _logRoute('🔀 Substituiu rota (Replace)', newRoute);
    }
  }

  // Helper para formatar o log
  void _logRoute(String action, Route<dynamic> route) {
    // Tenta pegar o nome da rota. Se for nulo (ex: Dialogs ou rotas anônimas), avisa.
    final String routeName = route.settings.name ?? 'Rota Anônima/Dialog';

    // arguments podem ser úteis para debug, mas cuidado com objetos grandes
    final args = route.settings.arguments != null
        ? ' | Args: ${route.settings.arguments}'
        : '';

    developer.log('$action: $routeName$args', name: 'Navigation');
  }
}
