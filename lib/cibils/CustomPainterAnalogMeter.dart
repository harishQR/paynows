import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vmath;

class CustomPainterAnalogMeter extends CustomPainter {
  final double value;

  CustomPainterAnalogMeter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    const Gradient gradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi * 2,
      tileMode: TileMode.repeated,
      colors: <Color>[
        Colors.green,
        Colors.red,
        Colors.orange,
      ],
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..shader = gradient
            .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
        ..strokeWidth = 15,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
