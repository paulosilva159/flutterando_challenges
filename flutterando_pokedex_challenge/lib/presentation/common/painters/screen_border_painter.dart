import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenBorderPainter extends CustomPainter {
  ScreenBorderPainter({@required this.color}) : assert(color != null);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 18;

    final paint = Paint()..color = color;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    final topRightArc = Rect.fromCircle(
      center: Offset(
        size.width * 1 - radius,
        size.height * 0 + radius,
      ),
      radius: radius,
    );

    final topLeftArc = Rect.fromCircle(
      center: Offset(
        size.width * 0 + radius,
        size.height * 0 + radius,
      ),
      radius: radius,
    );

    final bottomRightArc = Rect.fromCircle(
      center: Offset(
        size.width * 1 - radius,
        size.height * 1 - radius,
      ),
      radius: radius,
    );

    final screenPath = Path()
      ..moveTo(size.width / 2, size.height * 0)
      ..lineTo(size.width - radius, 0)
      ..arcTo(topRightArc, -pi / 2, pi / 2, false)
      ..lineTo(size.width * 1, size.height - radius)
      ..arcTo(bottomRightArc, 0, pi / 2, false)
      ..lineTo(size.width * 0 + radius * 3, size.height * 1)
      ..lineTo(size.width * 0, size.height * 1 - radius * 3)
      ..lineTo(size.width * 0, size.height * 0 + radius)
      ..arcTo(topLeftArc, pi, pi / 2, false)
      ..close();

    canvas..drawPath(screenPath, paint)..drawPath(screenPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
