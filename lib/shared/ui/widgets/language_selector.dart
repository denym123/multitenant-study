import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global_modules/global_modules.dart';
import '../../shared.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleStore>(
      builder: (context, localeStore, child) {
        final currentLocale = localeStore.locale;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageButton(
              label: 'PT',
              isSelected: currentLocale.languageCode == 'pt',
              onTap: () => localeStore.setLocale(const Locale('pt')),
            ),
            const SizedBox(width: 8),
            _LanguageButton(
              label: 'ES',
              isSelected: currentLocale.languageCode == 'es',
              onTap: () => localeStore.setLocale(const Locale('es')),
            ),
          ],
        );
      },
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline.withOpacity(0.5),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            color: isSelected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
