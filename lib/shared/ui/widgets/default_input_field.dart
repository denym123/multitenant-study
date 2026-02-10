import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/shared.dart';

class DefaultInputField extends StatelessWidget {
  final String? label;
  final bool autoCorrect;
  final String? hint;
  final TextEditingController controller;
  final String? errorText;
  final List<String>? masks;
  final TextInputType? keyboardType;
  final String? Function(String? p0)? validator;
  final bool readOnly;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final VoidCallback? onTap;
  final bool? enabled;
  final int? maxLines;
  final bool? enableInteractiveSelection;
  final Color? labelColor;
  final bool showShadow;
  final AutovalidateMode? autoValidateMode;
  final FieldValidationHandler? validatorHandler;
  final String? validationField;
  final void Function(String value)? onChanged;

  DefaultInputField({
    super.key,
    this.errorText,
    this.autoCorrect = true,
    this.label,
    required this.controller,
    this.masks,
    this.keyboardType,
    this.hint,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.enabled,
    this.maxLines,
    this.enableInteractiveSelection,
    this.labelColor,
    this.showShadow = true,
    this.autoValidateMode,

    // Validação manual
    this.validator,
    this.onChanged,

    // Validação automática
    this.validatorHandler,
    this.validationField,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText),
       assert(
         (validatorHandler == null && validationField == null) ||
             (validatorHandler != null && validationField != null),
         'validatorHandler e validationField devem ser fornecidos juntos.',
       ),
       assert(
         (validatorHandler == null) || (validator == null),
         'Não é possível fornecer um validator manual e um validatorHandler ao mesmo tempo.',
       ),
       assert(
         (validatorHandler == null) || (onChanged == null),
         'Não é possível fornecer um onChanged manual e um validatorHandler ao mesmo tempo.',
       );

  @override
  Widget build(BuildContext context) {
    final FormFieldValidator<String>? finalValidator = validatorHandler != null
        ? (value) => validatorHandler!.validate(validationField!, value)
        : validator;

    final ValueChanged<String>? finalOnChanged = validatorHandler != null
        ? (value) => validatorHandler!.clearError(validationField!)
        : onChanged;

    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? '',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            Gap(4),
            TextFormField(
              autocorrect: autoCorrect,
              maxLines: maxLines ?? 1,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: controller,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 14),
              onTap: onTap,
              autovalidateMode:
                  autoValidateMode ?? AutovalidateMode.onUserInteraction,
              enabled: enabled,
              readOnly: readOnly,
              onChanged: finalOnChanged,
              keyboardType: keyboardType,
              obscureText: obscureTextVNValue,
              cursorColor: Theme.of(context).colorScheme.secondary,
              inputFormatters: masks != null
                  ? [TextInputMask(mask: masks)]
                  : null,
              validator: finalValidator,
              enableInteractiveSelection: enableInteractiveSelection,
              decoration: InputDecoration(
                errorMaxLines: 3,
                errorText: errorText,
                errorStyle: TextStyle(fontSize: 12),
                enabled: enabled ?? true,
                border: _defaultBorder(context),
                disabledBorder: _defaultBorder(context).copyWith(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                enabledBorder: _defaultBorder(context),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: context.colorScheme.secondary,
                  ),
                ),
                fillColor: context.colorScheme.surface,
                filled: true,
                hintText: hint,
                hintStyle: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.3),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
                suffixIcon: obscureText
                    ? IconButton(
                        constraints: const BoxConstraints(),

                        onPressed: () {
                          _obscureTextVN.value = !obscureTextVNValue;
                        },
                        icon: obscureTextVNValue
                            ? Icon(
                                LucideIcons.eye,
                                size: 20,
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                              )
                            : Icon(
                                LucideIcons.eyeOff,
                                size: 20,
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                              ),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder _defaultBorder(context) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.outline,
      width: 1,
    ),
  );
}
