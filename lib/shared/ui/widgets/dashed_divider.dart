import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final double dashLength;
  final double dashGapLength;
  final Color color;
  final double thickness;
  final StrokeCap strokeCap;

  const DashedDivider({
    super.key,
    this.dashLength = 4.0,
    this.dashGapLength = 4.0,
    this.color = Colors.black,
    this.thickness = 1.0,
    this.strokeCap = StrokeCap.round,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedLinePainter(
        dashLength: dashLength,
        dashGapLength: dashGapLength,
        color: color,
        thickness: thickness,
        strokeCap: strokeCap,
      ),
      size: Size.fromHeight(thickness),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashLength;
  final double dashGapLength;
  final Color color;
  final double thickness;
  final StrokeCap strokeCap;

  _DashedLinePainter({
    required this.dashLength,
    required this.dashGapLength,
    required this.color,
    required this.thickness,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = strokeCap;

    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashLength, size.height / 2),
        paint,
      );
      currentX += dashLength + dashGapLength;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) {
    return oldDelegate.dashLength != dashLength ||
        oldDelegate.dashGapLength != dashGapLength ||
        oldDelegate.color != color ||
        oldDelegate.thickness != thickness ||
        oldDelegate.strokeCap != strokeCap;
  }
}
