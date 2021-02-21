import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({
    @required this.height,
  }) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: height,
        child: const CustomPaint(
          painter: InnerScreenButtonPainter(
            color: PokedexColors.innerPokedexScreenButton,
          ),
        ),
      );
}

class InnerScreenButtonPainter extends CustomPainter {
  const InnerScreenButtonPainter({@required this.color})
      : assert(color != null);

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
