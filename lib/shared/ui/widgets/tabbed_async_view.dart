import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../helpers/async_signal_cache.dart';

class TabbedAsyncView<Item, K> extends StatefulWidget {
  final List<Item> items; // dados das abas (ex.: cursos)
  final K Function(Item) keyOf; // extrai chave (ex.: id do curso)
  final String Function(Item) labelOf; // rotulo na Tab
  final AsyncSignalCache<K, dynamic> cache; // cache que fornece os sinais
  final Widget Function(BuildContext, AsyncState<dynamic>, Item) builder;
  final void Function(int index)? onTabChanged;

  const TabbedAsyncView({
    super.key,
    required this.items,
    required this.keyOf,
    required this.labelOf,
    required this.cache,
    required this.builder,
    this.onTabChanged,
  });

  @override
  State<TabbedAsyncView<Item, K>> createState() =>
      _TabbedAsyncViewState<Item, K>();
}

class _TabbedAsyncViewState<Item, K> extends State<TabbedAsyncView<Item, K>>
    with TickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: widget.items.length, vsync: this)
      ..addListener(_handleTabChange);
    // carrega primeira aba
    _loadCurrent();
  }

  // @override
  // void didUpdateWidget(covariant TabbedAsyncView<Item, Key> old) {
  //   super.didUpdateWidget(old);
  //   if (old.items.length != widget.items.length) {
  //     _tabs.dispose();
  //     _tabs = TabController(length: widget.items.length, vsync: this)
  //       ..addListener(_handleTabChange);
  //     _loadCurrent();
  //   }
  // }

  void _handleTabChange() {
    if (!_tabs.indexIsChanging) {
      widget.onTabChanged?.call(_tabs.index);
      _loadCurrent();
    }
  }

  void _loadCurrent() {
    final item = widget.items[_tabs.index];
    widget.cache.load(widget.keyOf(item));
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          indicatorColor: Color(0xFF0D6CC4),
          tabAlignment: TabAlignment.start,
          controller: _tabs,
          isScrollable: true,
          tabs: [for (final i in widget.items) Tab(text: widget.labelOf(i))],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              for (final item in widget.items)
                Watch(
                  (_) => widget.builder(
                    context,
                    widget.cache(widget.keyOf(item)).value,
                    item,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
