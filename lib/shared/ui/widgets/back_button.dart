import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

class PrimaryBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PrimaryBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: context.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: BackButton(
        onPressed: onPressed,
        style: ButtonStyle(iconSize: WidgetStatePropertyAll(25)),
        color: context.primaryColor,
      ),
    );
  }
}
