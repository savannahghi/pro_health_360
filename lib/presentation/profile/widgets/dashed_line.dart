// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashedLine extends CustomPainter {
  const DashedLine({
    required this.dashSize,
    required this.gapSize,
    Color? color,
    double? dotOffset,
    double? dashOffset,
  })  : color = color ?? Colors.black,
        dotOffset = dotOffset ?? 0,
        dashOffset = dashOffset ?? 0;

  final double dashSize;
  final double gapSize;
  final Color color;
  final double dotOffset;
  final double dashOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = this.color
      ..strokeWidth = 1;

    final Paint circlePaint = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;

    double startY = 0;
    canvas.drawCircle(Offset(0, startY + dotOffset), 4, circlePaint);

    startY = startY + dashOffset;
    while (startY < size.height) {
      final Offset p1 = Offset(0, startY);
      final Offset p2 = Offset(0, startY + dashSize);

      canvas.drawLine(p1, p2, linePaint);

      startY += dashSize + gapSize;
    }
  }

  @override
  bool shouldRepaint(DashedLine oldDelegate) {
    return dashSize != oldDelegate.dashSize || gapSize != oldDelegate.gapSize;
  }
}
