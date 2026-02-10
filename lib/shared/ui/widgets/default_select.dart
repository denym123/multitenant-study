import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../shared.dart';

// 1. Converter para StatefulWidget
class DefaultSelect<T> extends StatefulWidget {
  final T? selectedItem;
  // 2. Mudar de 'data' para 'dataGetter'. Agora esperamos uma FUNÇÃO que retorna um Future.
  final Future<List<T>> Function() dataGetter;
  final Function(T) onChanged;
  final String label;
  final bool enabled;
  final String Function(T)? itemAsString;

  const DefaultSelect({
    super.key,
    this.selectedItem,
    required this.dataGetter, // Nome atualizado
    required this.onChanged,
    this.label = 'Selecione',
    this.enabled = true,
    this.itemAsString,
  });

  @override
  State<DefaultSelect<T>> createState() => _DefaultSelectState<T>();
}

class _DefaultSelectState<T> extends State<DefaultSelect<T>> {
  late Future<List<T>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = widget.dataGetter();
  }

  void _retry() {
    _dataFuture = widget.dataGetter();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      enabled: widget.enabled,
      suffixProps: DropdownSuffixProps(
        clearButtonProps: ClearButtonProps(icon: Icon(LucideIcons.x)),
        dropdownButtonProps: DropdownButtonProps(
          iconClosed: Icon(LucideIcons.chevronDown),
          iconOpened: Icon(LucideIcons.chevronUp, color: context.primaryColor),
        ),
      ),
      decoratorProps: DropDownDecoratorProps(
        baseStyle: context.textTheme.bodyLarge,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.enabled == false
              ? context.colorScheme.onSurface
              : Theme.of(context).colorScheme.surfaceContainerLowest,
          border: _defaultBorder(context),
          label: Text(widget.label),
          hintText: 'Selecione um ${widget.label}',
        ),
      ),
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        showSearchBox: true,
        showSelectedItems: true,
        menuProps: MenuProps(
          backgroundColor: context.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            label: Text(widget.label),
            border: _defaultBorder(context),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            hintText: 'Pesquisar...',
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
        // 6. Atualizar o errorBuilder com o botão "Tentar Novamente"
        errorBuilder: (context, searchEntry, exception) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.file, color: Colors.red, size: 40),
                const SizedBox(height: 8),
                const Text(
                  'Erro ao carregar dados',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    _retry();
                    context.pop();
                  }, // Chama a função para tentar novamente
                  icon: const Icon(LucideIcons.refreshCw),
                  label: const Text('Tentar Novamente'),
                ),
              ],
            ),
          );
        },
      ),
      onChanged: (item) {
        if (item != null) {
          widget.onChanged(item);
        }
      },

      compareFn: (item1, item2) => item1?.toString() == item2?.toString(),
      itemAsString: (T item) {
        if (widget.itemAsString != null) {
          return widget.itemAsString!(item);
        }
        try {
          return (item as dynamic).name;
        } catch (e) {
          return 'ERRO: Objeto inválido';
        }
      },
      selectedItem: widget.selectedItem,
      items: (_, __) async => _dataFuture,
    );
  }

  OutlineInputBorder _defaultBorder(context) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Theme.of(
        context,
      ).colorScheme.inverseSurface.withValues(alpha: 0.3),
      width: 1,
    ),
  );
}
