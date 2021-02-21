import 'package:flutter/material.dart';

class GlassCrystalPainter extends CustomPainter {
  GlassCrystalPainter({
    @required this.gradientColor,
    this.hasOuterRing = false,
  }) : assert(gradientColor != null);

  final List<Color> gradientColor;
  final bool hasOuterRing;

  @override
  void paint(Canvas canvas, Size size) {
    final centerOffset = Offset(size.width / 2, size.height / 2);

    final radius = size.height / 2;

    Rect rect(double radius) => Rect.fromCircle(
          center: centerOffset,
          radius: radius,
        );

    Shader gradientShader(double radius) => RadialGradient(
            center: Alignment.center,
            colors: gradientColor,
            radius: .5,
            tileMode: TileMode.mirror,
            stops: const [.25, .65, 1]).createShader(
          rect(radius),
        );

    Paint innerPaint(double radius) => Paint()..shader = gradientShader(radius);

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = hasOuterRing ? 1.5 : 1
      ..color = Colors.black;

    final ringPaint = Paint()..color = Colors.white;

    if (hasOuterRing) {
      canvas
        ..drawOval(
          rect(radius),
          ringPaint,
        )
        ..drawOval(
          rect(radius),
          strokePaint,
        )
        ..drawOval(
          rect(radius * .8),
          innerPaint(radius * .8),
        )
        ..drawOval(
          rect(radius * .8),
          strokePaint,
        );
    } else {
      canvas
        ..drawOval(
          rect(radius),
          innerPaint(radius),
        )
        ..drawOval(
          rect(radius),
          strokePaint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
