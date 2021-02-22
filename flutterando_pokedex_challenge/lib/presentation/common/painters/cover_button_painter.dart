import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoverButtonPainter extends CustomPainter {
  CoverButtonPainter(
      {@required this.color, @required this.depthColor, @required this.depth})
      : assert(color != null),
        assert(depthColor != null),
        assert(depth != null);

  final Color color;
  final Color depthColor;
  final double depth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final depthPaint = Paint()..color = depthColor;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black;

    final depthStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5
      ..color = Colors.black;

    final path = Path()
      ..lineTo(size.width * 1, size.height / 2)
      ..lineTo(size.width * 0, size.height * 1)
      ..close();

    final depthPath = Path()
      ..lineTo(size.width * 1, size.height / 2)
      ..lineTo(size.width * 1 - depth * sin(pi / 4),
          size.height / 2 + depth * cos(pi / 4))
      ..lineTo(size.width * 0, size.height * 0 + depth)
      ..close();

    canvas
      ..drawPath(path, paint)
      ..drawPath(path, strokePaint)
      ..drawPath(depthPath, depthPaint)
      ..drawPath(depthPath, depthStrokePaint);
  }

  @override
  bool shouldRepaint(CoverButtonPainter oldDelegate) =>
      oldDelegate.depth != depth;
}
