import 'package:flutter/cupertino.dart';
import 'package:signals/signals.dart';

class FutureHandler<T> {
  final AsyncSignal<T> asyncSignal;
  Future<T> Function() futureFunction;
  ValueSetter<T>? onValue;
  void Function(Object e, StackTrace s)? catchError;

  FutureHandler({
    required this.asyncSignal,
    required this.futureFunction,
    this.onValue,
    this.catchError,
  });

  Future<void> call() async {
    try {
      asyncSignal.value = AsyncLoading<T>();
      T response = await futureFunction();
      asyncSignal.value = AsyncData(response);
      if (onValue != null) onValue!(response);
    } catch (e, s) {
      asyncSignal.value = AsyncError(e, s);
      if (catchError != null) catchError!(e, s);
    }
  }
}
