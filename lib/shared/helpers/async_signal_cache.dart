import 'package:signals/signals.dart';

class AsyncSignalCache<K, T> {
  final Future<T> Function(K key) loader;
  final _cache = <K, Signal<AsyncState<T>>>{};

  AsyncSignalCache({required this.loader});

  Signal<AsyncState<T>> call(K key) =>
      _cache.putIfAbsent(key, () => signal<AsyncState<T>>(AsyncLoading()));

  Future<void> load(K key) async {
    final slot = call(key);
    if (slot.value is AsyncData) return; // já em cache
    try {
      slot.value = AsyncData(await loader(key));
    } catch (e, s) {
      slot.value = AsyncError(e, s);
    }
  }
}
