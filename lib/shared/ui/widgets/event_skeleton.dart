import 'dart:math';

import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import 'widgets.dart';

class EventSkeleton extends StatelessWidget {
  const EventSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: (MediaQuery.of(context).size.width - 48) * (9 / 16),
          ),
          Gap(10),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            width: Random().nextDouble() * (200 - 150) + 200,
          ),
          Gap(10),
          Container(
            height: 14,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            width: Random().nextDouble() * (200 - 150) + 150,
          ),
          Gap(10),
          Container(
            height: 14,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            width: Random().nextDouble() * (200 - 150) + 150,
          ),
        ],
      ),
    );
  }
}
