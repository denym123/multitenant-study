import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final Color? color;
  const TitleComponent({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
          ),
    );
  }
}
