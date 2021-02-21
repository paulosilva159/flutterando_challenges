import 'dart:math';

import 'package:flutter/material.dart';

class RollerPainter extends CustomPainter {
  RollerPainter({@required this.color, @required this.gapColor})
      : assert(color != null),
        assert(gapColor != null);

  final Color color;
  final Color gapColor;

  @override
  void paint(Canvas canvas, Size size) {
    const gapHeight = 4.0;

    final topBarHeight = size.height * 3 / 11;

    final topBarShadowHeight = topBarHeight / 12;

    Rect arcRect({
      double gapHeightOffset = 0,
      double gapWidthOffset = 0,
    }) =>
        Rect.fromCenter(
          center: Offset(
            size.width * 1 + gapWidthOffset,
            size.height * 0 - topBarHeight * .5 + gapHeightOffset,
          ),
          height: topBarShadowHeight * 2,
          width: size.width * 2,
        );

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black;

    final gapPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = gapColor;

    final topRollerPath = Path()
      ..lineTo(size.width * 0, size.height * 0 - topBarHeight * .5)
      ..addArc(arcRect(), pi, pi / 2)
      ..lineTo(size.width * 1, size.height * 0)
      ..lineTo(size.width * 0, size.height * 0)
      ..addArc(arcRect(gapHeightOffset: topBarHeight * .5), pi, pi / 2)
      ..lineTo(size.width * 1, 0)
      ..close();

    final topRollerGapPath = Path()
      ..addArc(arcRect(gapHeightOffset: topBarHeight * .5), pi, pi / 2)
      ..lineTo(size.width * 1, 0)
      ..close();

    final middleRollerPath = Path()
      ..addArc(
          arcRect(gapHeightOffset: topBarHeight * .5 + gapHeight), pi, pi / 2)
      ..lineTo(size.width * 1, size.height * 1 - topBarHeight * .5)
      ..lineTo(size.width * 0, size.height * 1 - topBarHeight * .5)
      ..addArc(
        arcRect(gapHeightOffset: size.height * 1),
        pi,
        pi / 2,
      )
      ..moveTo(size.width * 0, size.height * 1 - topBarHeight * .5)
      ..lineTo(size.width * 0, size.height * 0 + gapHeight)
      ..close();

    final middleRollerGapPath = Path()
      ..moveTo(size.width * 0, size.height * 1 - topBarHeight * .5)
      ..addArc(
        arcRect(gapHeightOffset: size.height * 1),
        pi,
        pi / 2,
      )
      ..lineTo(size.width * 1, size.height * 1 - topBarHeight * .5)
      ..lineTo(size.width * 0, size.height * 1 - topBarHeight * .5)
      ..close();

    final bottomRollerPath = Path()
      ..moveTo(size.width * 0, size.height * 1 + gapHeight)
      ..addArc(
          arcRect(gapHeightOffset: size.height * 1 + gapHeight), pi, pi / 2)
      ..lineTo(size.width * 1, size.height * 1)
      ..lineTo(size.width * 0, size.height * 1)
      ..close();

    Shader gradientColor(Path path) => LinearGradient(
          colors: [color, const Color(0xFFF06279), color],
          tileMode: TileMode.mirror,
          stops: const [0, .5, 1],
        ).createShader(
          path.getBounds(),
        );

    Paint rollerPaint(Path path) => Paint()..shader = gradientColor(path);

    canvas
      ..drawPath(topRollerPath, rollerPaint(topRollerPath))
      ..drawPath(topRollerGapPath, gapPaint)
      ..drawPath(topRollerPath, strokePaint)
      ..drawPath(middleRollerPath, rollerPaint(middleRollerPath))
      ..drawPath(middleRollerGapPath, gapPaint)
      ..drawPath(middleRollerPath, strokePaint)
      ..drawPath(bottomRollerPath, rollerPaint(bottomRollerPath))
      ..drawPath(bottomRollerPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
