import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class LeftRollerPainter extends CustomPainter {
  LeftRollerPainter({@required this.color, @required this.gapColor})
      : assert(color != null),
        assert(gapColor != null);

  final Color color;
  final Color gapColor;

  @override
  void paint(Canvas canvas, Size size) {
    const gapHeight = 4.0;

    final topBarHeight = size.height *
        Proportions.outerPokedexTopBarHeightProportion /
        Proportions.innerPokedexInsideContentHeightProportion;

    final topBarDepthHeight = topBarHeight / 12;

    Rect arcRect({
      double gapHeightOffset = 0,
      double gapWidthOffset = 0,
    }) =>
        Rect.fromCenter(
          center: Offset(
            size.width * 1 + gapWidthOffset,
            size.height * 0 - topBarHeight * .5 + gapHeightOffset,
          ),
          height: topBarDepthHeight * 2,
          width: size.width * 2,
        );

    final gapPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = gapColor;

    final topRollerPath = Path()
      ..lineTo(size.width * 0,
          size.height * 0 - topBarHeight * .5 - topBarDepthHeight)
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
          stops: const [0, .3, 1],
        ).createShader(
          path.getBounds(),
        );

    Paint rollerPaint(Path path) => Paint()..shader = gradientColor(path);

    canvas
      ..drawPath(topRollerPath, rollerPaint(topRollerPath))
      ..drawPath(topRollerGapPath, gapPaint)
      ..drawPath(middleRollerPath, rollerPaint(middleRollerPath))
      ..drawPath(middleRollerGapPath, gapPaint)
      ..drawPath(bottomRollerPath, rollerPaint(bottomRollerPath));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
