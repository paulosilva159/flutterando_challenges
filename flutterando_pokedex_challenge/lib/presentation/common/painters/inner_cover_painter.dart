import 'package:flutter/material.dart';

class InnerCoverPainter extends CustomPainter {
  InnerCoverPainter({
    @required this.color,
    @required this.gapColor,
  })  : assert(color != null),
        assert(gapColor != null);

  final Color color;
  final Color gapColor;

  @override
  void paint(Canvas canvas, Size size) {
    drawCover(canvas, size, color);
    drawInnerCover(canvas, size, color);
    drawInnerCoverDepth(canvas, size, gapColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void drawCover(Canvas canvas, Size size, Color color) {
  final _size = size * 11 / 10;

  const gapHeight = 4.0;

  final rollerWidth = size.width / 13;

  final topBarHeight = size.height * 3 / 11;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final coverPath = Path()
    ..moveTo(_size.width * 0 - rollerWidth * .25,
        size.height * 0 - topBarHeight * .5 - gapHeight * 1.75)
    ..relativeLineTo(_size.width * 2 / 5, 0)
    ..relativeLineTo(_size.width * 1 / 5, topBarHeight * .5)
    ..relativeLineTo(_size.width * 2 / 5 - rollerWidth * 1, 0)
    ..lineTo(_size.width * 1 - rollerWidth * 1.25, size.height * 1)
    ..lineTo(_size.width * 0 - rollerWidth * .25, size.height * 1)
    ..close();

  canvas
    ..drawPath(coverPath, coverPaint)
    ..drawPath(coverPath, coverStrokePaint);
}

void drawInnerCover(Canvas canvas, Size size, Color color) {
  final _size = size * 11 / 10;

  const gapHeight = 4.0;
  const insideGapHeight = 16.0;

  final rollerWidth = size.width / 13;

  final topBarHeight = size.height * 3 / 11;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final innerPath = Path()
    ..moveTo(
      _size.width * 0 - rollerWidth * .25 + insideGapHeight,
      size.height * 0 - topBarHeight * .5 - gapHeight * 1.75 + insideGapHeight,
    )
    ..relativeLineTo(_size.width * 2 / 5 - insideGapHeight, 0)
    ..relativeLineTo(_size.width * 1 / 5, topBarHeight * .5)
    ..relativeLineTo(_size.width * 2 / 5 - rollerWidth * 1 - insideGapHeight, 0)
    ..lineTo(_size.width * 1 - rollerWidth * 1.25 - insideGapHeight,
        size.height * 1 - insideGapHeight)
    ..lineTo(_size.width * 0 - rollerWidth * .25 + insideGapHeight,
        size.height * 1 - insideGapHeight)
    ..close();

  canvas
    ..drawPath(innerPath, coverPaint)
    ..drawPath(innerPath, coverStrokePaint);
}

void drawInnerCoverDepth(Canvas canvas, Size size, Color color) {
  final _size = size * 11 / 10;

  const gapHeight = 4.0;
  const insideGapHeight = 16.0;
  final depthHeight = size.height / 44;

  final rollerWidth = size.width / 13;

  final topBarHeight = size.height * 3 / 11;

  final coverStrokePaint = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.black;

  final coverPaint = Paint()..color = color;

  final innerPath = Path()
    ..moveTo(
      _size.width * 0 - rollerWidth * .25 + insideGapHeight,
      size.height * 0 - topBarHeight * .5 - gapHeight * 1.75 + insideGapHeight,
    )
    ..relativeLineTo(_size.width * 2 / 5 - insideGapHeight, 0)
    ..relativeLineTo(_size.width * 1 / 5, topBarHeight * .5)
    ..relativeLineTo(_size.width * 2 / 5 - rollerWidth * 1 - insideGapHeight, 0)
    ..lineTo(_size.width * 1 - rollerWidth * 1.25 - insideGapHeight,
        size.height * 0 + insideGapHeight - gapHeight * 1.75 + depthHeight)
    ..lineTo(_size.width * 1 - rollerWidth * 1.25 - insideGapHeight,
        size.height * 0 + insideGapHeight - gapHeight * 1.75 + depthHeight)
    ..relativeLineTo(
        -(_size.width * 2 / 5 - rollerWidth * 1 - insideGapHeight), 0)
    ..relativeLineTo(-_size.width * 1 / 5, -topBarHeight * .5)
    ..lineTo(
      _size.width * 0 - rollerWidth * .25 + insideGapHeight,
      size.height * 0 -
          topBarHeight * .5 -
          gapHeight * 1.75 +
          insideGapHeight +
          depthHeight,
    )
    ..close();

  canvas
    ..drawPath(innerPath, coverPaint)
    ..drawPath(innerPath, coverStrokePaint);
}
