import 'package:flutter/material.dart';

class DirectionalButtonsGroupPainter extends CustomPainter {
  DirectionalButtonsGroupPainter({
    @required this.colorList,
  }) : assert(colorList != null);

  final List<Color> colorList;

  @override
  void paint(Canvas canvas, Size size) {
    final arrowHeight = size.width / 12;

    final arrowPaint = Paint()..color = Colors.black;

    final leftArrowOffset =
        Offset(size.width / 6 + arrowHeight / 2, size.height / 2);

    Path leftArrowPath(Offset offset) => Path()
      ..moveTo(offset.dx, offset.dy)
      ..relativeLineTo(-arrowHeight, 0)
      ..relativeLineTo(arrowHeight, -arrowHeight / 2)
      ..relativeLineTo(0, arrowHeight)
      ..relativeLineTo(-arrowHeight, -arrowHeight / 2)
      ..close();

    final rightArrowOffset =
        Offset(size.width * 5 / 6 - arrowHeight / 2, size.height / 2);

    Path rightArrowPath(Offset offset) => Path()
      ..moveTo(offset.dx, offset.dy)
      ..relativeLineTo(arrowHeight, 0)
      ..relativeLineTo(-arrowHeight, -arrowHeight / 2)
      ..relativeLineTo(0, arrowHeight)
      ..relativeLineTo(arrowHeight, -arrowHeight / 2)
      ..close();

    final topArrowOffset =
        Offset(size.width / 2, size.height / 6 + arrowHeight / 2);

    Path topArrowPath(Offset offset) => Path()
      ..moveTo(offset.dx, offset.dy)
      ..relativeLineTo(arrowHeight / 2, 0)
      ..relativeLineTo(-arrowHeight / 2, -arrowHeight)
      ..relativeLineTo(-arrowHeight / 2, arrowHeight)
      ..relativeLineTo(arrowHeight / 2, 0)
      ..close();

    final bottomArrowOffset =
        Offset(size.width / 2, size.height * 5 / 6 - arrowHeight / 2);

    Path bottomArrowPath(Offset offset) => Path()
      ..moveTo(offset.dx, offset.dy)
      ..relativeLineTo(arrowHeight / 2, 0)
      ..relativeLineTo(-arrowHeight / 2, arrowHeight)
      ..relativeLineTo(-arrowHeight / 2, -arrowHeight)
      ..relativeLineTo(arrowHeight / 2, 0);

    final circlePaint = Paint()..color = Colors.black;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    final centerCircle = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: arrowHeight);

    final path = Path()
      ..moveTo(size.width / 3, size.height * 0)
      ..relativeLineTo(size.width / 3, 0)
      ..relativeLineTo(0, size.height / 3)
      ..relativeLineTo(size.width / 3, 0)
      ..relativeLineTo(0, size.height / 3)
      ..relativeLineTo(-size.width / 3, 0)
      ..relativeLineTo(0, size.height / 3)
      ..relativeLineTo(-size.width / 3, 0)
      ..relativeLineTo(0, -size.height / 3)
      ..relativeLineTo(-size.width / 3, 0)
      ..relativeLineTo(0, -size.height / 3)
      ..relativeLineTo(size.width / 3, 0)
      ..relativeLineTo(0, -size.height / 3)
      ..close();

    final gradientShader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colorList,
    ).createShader(path.getBounds());

    final paint = Paint()..shader = gradientShader;

    canvas
      ..drawPath(path, paint)
      ..drawPath(path, strokePaint)
      ..drawPath(leftArrowPath(leftArrowOffset), arrowPaint)
      ..drawPath(rightArrowPath(rightArrowOffset), arrowPaint)
      ..drawPath(topArrowPath(topArrowOffset), arrowPaint)
      ..drawPath(bottomArrowPath(bottomArrowOffset), arrowPaint)
      ..drawOval(centerCircle, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
