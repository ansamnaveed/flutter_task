import 'dart:math' as math;

import 'package:flutter/material.dart';

class MoodWheelPainter extends CustomPainter {
  final double angle;

  MoodWheelPainter({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 30;

    final colors = [
      const Color(0xFF6EB9AD),
      const Color(0xFFF99955),
      const Color(0xFFC9BBEF),
      const Color(0xFFF28DB3),
    ];

    final sweepGradient = SweepGradient(
      colors: colors,
      stops: List.generate(colors.length, (i) => i / (colors.length - 1)),
      transform: const GradientRotation(-math.pi / 2),
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..strokeWidth = 35
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant MoodWheelPainter oldDelegate) =>
      oldDelegate.angle != angle;
}
