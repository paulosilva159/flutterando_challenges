import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class InnerCoverPainter extends CustomPainter {
  InnerCoverPainter({
    @required this.color,
    @required this.gapColor,
    @required this.innerColor,
  })  : assert(color != null),
        assert(gapColor != null),
        assert(innerColor != null);

  final Color color;
  final Color gapColor;
  final Color innerColor;

  @override
  void paint(Canvas canvas, Size size) {
    const insideGapHeight = 16.0;

    drawCover(canvas, size, color);
    drawInnerCover(canvas, size, innerColor, insideGapHeight);
    drawInnerCoverDepth(canvas, size, gapColor, insideGapHeight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void drawCover(Canvas canvas, Size size, Color color) {
  final _size = size *
      ((Proportions.outerPokedexRollerWidthProportion +
              Proportions.innerPokedexInsideContentWidthProportion) /
          Proportions.innerPokedexInsideContentWidthProportion);

  final rollerWidth = _size.width /
      (Proportions.innerPokedexInsideContentWidthProportion +
          Proportions.outerPokedexRollerWidthProportion);

  final topBarHeight = _size.height *
      Proportions.outerPokedexTopBarHeightProportion /
      Proportions.innerPokedexInsideContentHeightProportion;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final coverPath = Path()
    ..moveTo(
      _size.width * 0 - rollerWidth * .15,
      _size.height * 0 - topBarHeight * .5,
    )
    ..relativeLineTo(_size.width * 2 / 5, 0)
    ..relativeLineTo(_size.width * 1 / 5, topBarHeight * .5)
    ..relativeLineTo(_size.width * 2 / 5, 0)
    ..relativeLineTo(0, _size.height * 1)
    ..relativeLineTo(-_size.width * 1, 0)
    ..close();

  canvas
    ..drawPath(coverPath, coverPaint)
    ..drawPath(coverPath, coverStrokePaint);
}

void drawInnerCover(
    Canvas canvas, Size size, Color color, double insideGapHeight) {
  final _size = size *
      ((Proportions.outerPokedexRollerWidthProportion +
              Proportions.innerPokedexInsideContentWidthProportion) /
          Proportions.innerPokedexInsideContentWidthProportion);

  final rollerWidth = _size.width /
      (Proportions.innerPokedexInsideContentWidthProportion +
          Proportions.outerPokedexRollerWidthProportion);

  final topBarHeight = _size.height *
      Proportions.outerPokedexTopBarHeightProportion /
      Proportions.innerPokedexInsideContentHeightProportion;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final innerPath = Path()
    ..moveTo(
      _size.width * 0 - rollerWidth * .15 + insideGapHeight,
      _size.height * 0 - topBarHeight * .5 + insideGapHeight,
    )
    ..relativeLineTo(
      _size.width * 2 / 5 - insideGapHeight,
      0,
    )
    ..relativeLineTo(
      _size.width * 1 / 5,
      topBarHeight * .5,
    )
    ..relativeLineTo(
      _size.width * 2 / 5 - insideGapHeight * 2 - rollerWidth * .25,
      0,
    )
    ..relativeLineTo(
      0,
      _size.height * 1 - topBarHeight / 2,
    )
    ..relativeLineTo(
      -_size.width * 1 + rollerWidth * .25 + insideGapHeight * 3,
      0,
    )
    ..close();

  canvas
    ..drawPath(innerPath, coverPaint)
    ..drawPath(innerPath, coverStrokePaint);
}

void drawInnerCoverDepth(
    Canvas canvas, Size size, Color color, double insideGapHeight) {
  final _size = size *
      ((Proportions.outerPokedexRollerWidthProportion +
              Proportions.innerPokedexInsideContentWidthProportion) /
          Proportions.innerPokedexInsideContentWidthProportion);

  final rollerWidth = _size.width /
      (Proportions.innerPokedexInsideContentWidthProportion +
          Proportions.outerPokedexRollerWidthProportion);

  final topBarHeight = _size.height *
      Proportions.outerPokedexTopBarHeightProportion /
      Proportions.innerPokedexInsideContentHeightProportion;

  final depthHeight = topBarHeight / 12;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final depthPath = Path()
    ..moveTo(
      _size.width * 0 - rollerWidth * .15 + insideGapHeight,
      _size.height * 0 - topBarHeight * .5 + insideGapHeight,
    )
    ..relativeLineTo(
      _size.width * 2 / 5 - insideGapHeight,
      0,
    )
    ..relativeLineTo(
      _size.width * 1 / 5,
      topBarHeight * .5,
    )
    ..relativeLineTo(
      _size.width * 2 / 5 - insideGapHeight * 2 - rollerWidth * .25,
      0,
    )
    ..relativeLineTo(
      0,
      depthHeight,
    )
    ..relativeLineTo(
      -_size.width * 2 / 5 + insideGapHeight * 2,
      0,
    )
    ..relativeLineTo(
      -_size.width * 1 / 5,
      -topBarHeight * .5,
    )
    ..relativeLineTo(
      -_size.width * 2 / 5 + rollerWidth * .25 + insideGapHeight,
      0,
    )
    ..close();

  canvas
    ..drawPath(depthPath, coverPaint)
    ..drawPath(depthPath, coverStrokePaint);
}
