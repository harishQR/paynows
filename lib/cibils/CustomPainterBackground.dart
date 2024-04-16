import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomPainterBackground extends CustomPainter {
  CustomPainterBackground();

  @override
  bool shouldRepaint(CustomPainterBackground oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    Path path = Path()..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.drawPath(
      path,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.blue.shade100,
            Colors.green.shade100,
            Colors.green.shade100,
            Colors.green.shade300,
          ],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.fill,
    );

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.grey.shade100,
            Colors.grey.shade100,
            Colors.grey.shade100,
            Colors.grey.shade300,
          ],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.fill,
    );
  }
}
