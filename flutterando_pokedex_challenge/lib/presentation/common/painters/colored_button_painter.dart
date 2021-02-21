import 'dart:math';

import 'package:flutter/material.dart';

class ColoredButtonPainter extends CustomPainter {
  ColoredButtonPainter({
    @required this.innerColor,
    @required this.strokeColor,
  })  : assert(innerColor != null),
        assert(strokeColor != null);

  final Color innerColor;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height / 4;

    final innerPaint = Paint()..color = innerColor;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height / 12
      ..color = strokeColor;

    final topRightArc = Rect.fromCircle(
      center: Offset(size.width * 1 - radius, size.height * 0 + radius),
      radius: radius,
    );

    final bottomRightArc = Rect.fromCircle(
      center: Offset(size.width * 1 - radius, size.height * 1 - radius),
      radius: radius,
    );

    final bottomLeftArc = Rect.fromCircle(
      center: Offset(size.width * 0 + radius, size.height * 1 - radius),
      radius: radius,
    );

    final topLeftArc = Rect.fromCircle(
      center: Offset(size.width * 0 + radius, size.height * 0 + radius),
      radius: radius,
    );

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width * 1 - radius, 0)
      ..arcTo(topRightArc, -pi / 2, pi / 2, false)
      ..lineTo(size.width * 1, size.height * 1 - radius)
      ..arcTo(bottomRightArc, 0, pi / 2, false)
      ..lineTo(size.width * 0 + radius, size.height * 1)
      ..arcTo(bottomLeftArc, pi / 2, pi / 2, false)
      ..lineTo(size.width * 0, size.height * 0 + radius)
      ..arcTo(topLeftArc, pi, pi / 2, false)
      ..close();

    canvas..drawPath(path, innerPaint)..drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
