import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashedLine extends CustomPainter {
  const DashedLine({
    required this.dashSize,
    required this.gapSize,
  });

  final double dashSize;
  final double gapSize;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    double startY = 0;

    while (startY < size.height) {
      final Offset p1 = Offset(0, startY);
      final Offset p2 = Offset(0, startY + dashSize);

      canvas.drawLine(p1, p2, paint);

      startY += dashSize + gapSize;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
