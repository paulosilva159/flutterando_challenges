import 'package:flutter/material.dart';

class ScreenButtonPainter extends CustomPainter {
  const ScreenButtonPainter({@required this.color}) : assert(color != null);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.height / 2,
    );

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
