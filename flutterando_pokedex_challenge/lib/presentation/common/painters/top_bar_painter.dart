import 'package:flutter/material.dart';

class TopBarPainter extends CustomPainter {
  TopBarPainter({@required this.barColor, @required this.shadowColor})
      : assert(barColor != null),
        assert(shadowColor != null);

  final Color barColor;
  final Color shadowColor;

  @override
  void paint(Canvas canvas, Size size) {
    final gapHeight = size.height / 12;

    final barPaint = Paint()..color = barColor;

    final shadowPaint = Paint()..color = shadowColor;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .75
      ..color = Colors.black;

    final barPath = Path()
      ..lineTo(size.width * 1, size.height * 0)
      ..lineTo(size.width * 1, size.height * .5)
      ..lineTo(size.width * 3 / 5, size.height * .5)
      ..lineTo(size.width * 2 / 5, size.height * 1)
      ..lineTo(size.width * 0, size.height * 1)
      ..close();

    final shadowPath = Path()
      ..moveTo(size.width * 0, size.height * 1 - gapHeight)
      ..lineTo(size.width * 2 / 5, size.height * 1 - gapHeight)
      ..lineTo(size.width * 3 / 5, size.height * .5 - gapHeight)
      ..lineTo(size.width * 1, size.height * .5 - gapHeight)
      ..lineTo(size.width * 1, size.height * .5)
      ..lineTo(size.width * 3 / 5, size.height * .5)
      ..lineTo(size.width * 2 / 5, size.height * 1)
      ..lineTo(size.width * 0, size.height * 1)
      ..close();

    canvas
      ..drawPath(barPath, barPaint)
      ..drawPath(barPath, strokePaint)
      ..drawPath(shadowPath, shadowPaint)
      ..drawPath(shadowPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
