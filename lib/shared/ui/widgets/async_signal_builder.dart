import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../shared.dart';

class AsyncSignalBuilder<T> extends StatelessWidget {
  // Recebe o sinal para fazer o Watch internamente
  final ReadonlySignal<AsyncState<T>?> signal;

  // Função de sucesso
  final Widget Function(BuildContext context, T data) builder;

  // A "parada" do onRetry
  final VoidCallback? onRetry;

  // Customizações opcionais
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? idleWidget; // Para quando o sinal for null (ainda não rodou)

  const AsyncSignalBuilder({
    super.key,
    required this.signal,
    required this.builder,
    this.onRetry,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.idleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final state = signal.value;

      // 1. Estado Idle (Null) - Antes de chamar o .call()
      if ((state?.value == null && state?.isLoading == false) ||
          state == null) {
        return idleWidget ?? const SizedBox.shrink();
      }

      // 2. Estado Loading
      if (state.isLoading) {
        return Center(
          child: loadingWidget ?? const CircularProgressIndicator(),
        );
      }

      // 3. Estado Error
      if (state.hasError) {
        // Aqui passamos o onRetry para o seu componente de erro
        return errorWidget ??
            ErrorHelper(
              error: state.error,
              onRetry: onRetry, // <--- O botão do ErrorHelper chama isso aqui
            );
      }

      // 4. Estado Sucesso (Data)
      if (state.hasValue) {
        final value = state.value as T;

        // Sua verificação de Lista Vazia
        if (value is List && value.isEmpty) {
          return Center(
            child: emptyWidget ?? const Text("Nenhum dado encontrado"),
          );
        }

        // Constrói a tela real
        return builder(context, value);
      }

      // Fallback
      return const SizedBox.shrink();
    });
  }
}
