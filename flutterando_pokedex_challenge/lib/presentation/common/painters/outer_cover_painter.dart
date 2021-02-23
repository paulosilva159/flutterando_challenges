import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class OuterCoverPainter extends CustomPainter {
  OuterCoverPainter({
    @required this.color,
    @required this.gapColor,
  })  : assert(color != null),
        assert(gapColor != null);

  final Color color;
  final Color gapColor;

  @override
  void paint(Canvas canvas, Size size) {
    const coverGapWidth = 120.0;
    const coverGapHeight = 24.0;

    final _size = size *
        ((Proportions.outerPokedexRollerWidthProportion +
                Proportions.innerPokedexInsideContentWidthProportion) /
            Proportions.innerPokedexInsideContentWidthProportion);

    final rollerWidth = size.width /
        (Proportions.outerPokedexRollerWidthProportion +
            Proportions.innerPokedexInsideContentWidthProportion);

    final topBarHeight = size.height *
        Proportions.outerPokedexTopBarHeightProportion /
        Proportions.innerPokedexInsideContentHeightProportion;

    final topBarShadowHeight = topBarHeight / 12;

    final coverStrokePaint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    final coverPaint = Paint()..color = color;

    final coverPath = Path()
      ..moveTo(_size.width * 0, size.height * 0 - topBarShadowHeight)
      ..relativeLineTo(_size.width * 2 / 5, 0)
      ..relativeLineTo(_size.width * 1 / 5, -topBarHeight * .5)
      ..relativeLineTo(_size.width * 2 / 5 - rollerWidth * .5, 0)
      ..lineTo(_size.width - rollerWidth * .5, size.height)
      ..lineTo(_size.width * 0, size.height * 1)
      ..close();

    final coverGapPaint = Paint()..color = gapColor;

    final coverGapRightArc = Rect.fromCircle(
      center: Offset(
          _size.width / 2 + coverGapWidth / 2, size.height - coverGapWidth / 2),
      radius: coverGapHeight / 2,
    );

    final coverGapLeftArc = Rect.fromCircle(
      center: Offset(
          _size.width / 2 - coverGapWidth / 2, size.height - coverGapWidth / 2),
      radius: coverGapHeight / 2,
    );

    final coverGapPath = Path()
      ..moveTo(
          size.width / 2, size.height - coverGapWidth / 2 - coverGapHeight / 2)
      ..relativeLineTo(coverGapWidth / 2, 0)
      ..arcTo(coverGapRightArc, -pi / 2, pi, false)
      ..relativeLineTo(-coverGapWidth, 0)
      ..arcTo(coverGapLeftArc, pi / 2, pi, false)
      ..relativeLineTo(coverGapWidth, 0)
      ..close();

    Rect coverGapDepthArc({bool isLeftArc, bool isSmaller = false}) =>
        Rect.fromCenter(
          center: Offset(
            _size.width / 2 + (isLeftArc ? -1 : 1) * coverGapWidth / 2,
            size.height - coverGapWidth / 2,
          ),
          height: coverGapHeight / (isSmaller ? 1.5 : 1),
          width: coverGapHeight,
        );

    final coverGapDepthPath = Path()
      ..moveTo(
          _size.width / 2, size.height - coverGapWidth / 2 - coverGapHeight / 2)
      ..relativeLineTo(-coverGapWidth / 2, 0)
      ..arcTo(
        coverGapDepthArc(isLeftArc: true),
        -pi / 2,
        -pi / 2,
        false,
      )
      ..arcTo(
        coverGapDepthArc(isLeftArc: true, isSmaller: true),
        pi,
        pi / 2,
        false,
      )
      ..relativeLineTo(coverGapWidth, 0)
      ..arcTo(
        coverGapDepthArc(isLeftArc: false, isSmaller: true),
        -pi / 2,
        pi / 2,
        false,
      )
      ..arcTo(
        coverGapDepthArc(isLeftArc: false),
        0,
        -pi / 2,
        false,
      )
      ..close();

    canvas
      ..drawPath(coverPath, coverPaint)
      ..drawPath(coverPath, coverStrokePaint)
      ..drawPath(coverGapPath, coverPaint)
      ..drawPath(coverGapPath, coverStrokePaint)
      ..drawPath(coverGapDepthPath, coverGapPaint)
      ..drawPath(coverGapDepthPath, coverStrokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
