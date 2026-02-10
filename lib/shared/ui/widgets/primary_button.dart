import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: !isLoading
          ? Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Colors.white),
            )
          : LoadingAnimationWidget.stretchedDots(color: Colors.white, size: 20),
    );
  }
}
