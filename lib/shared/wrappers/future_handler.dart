import 'package:flutter/foundation.dart';
import 'package:signals/signals.dart';

class FutureHandler<T> {
  /// O sinal que guardará o estado (Loading, Data, Error).
  /// Pode ser nulo se você só quiser usar o loadingSignal.
  final AsyncSignal<T>? asyncSignal;

  /// O sinal booleano para controlar loaders de botões (true/false).
  final Signal<bool>? loadingSignal;

  /// A função que executa a requisição.
  /// Deve ser uma função que retorna Future para garantir execução "Lazy".
  final Future<T> Function() repositoryFunction;

  /// Callbacks
  final ValueChanged<T>? onValue;
  final Function(Object error, StackTrace stack)? onError;
  final VoidCallback? whenComplete;

  FutureHandler({
    required this.repositoryFunction,
    this.asyncSignal,
    this.loadingSignal,
    this.onValue,
    this.onError,
    this.whenComplete,
  });

  Future<void> call() async {
    try {
      // 1. Atualiza estados para Loading
      loadingSignal?.value = true;
      if (asyncSignal != null) asyncSignal!.value = AsyncLoading<T>();

      // 2. Executa a função do repositório
      final result = await repositoryFunction();

      // 3. Sucesso: Atualiza sinal e chama callback
      if (asyncSignal != null) asyncSignal!.value = AsyncData(result);
      if (onValue != null) onValue!(result);
    } catch (e, s) {
      // 4. Erro: Atualiza sinal e chama callback
      if (asyncSignal != null) asyncSignal!.value = AsyncError(e, s);

      if (onError != null) {
        onError!(e, s);
      } else {
        debugPrint("FutureHandler Error: $e");
      }
    } finally {
      // 5. Finalização
      loadingSignal?.value = false;
      if (whenComplete != null) whenComplete!();
    }
  }
}
