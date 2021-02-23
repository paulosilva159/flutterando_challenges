import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/screen_button_painter.dart';
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
          painter: ScreenButtonPainter(
            color: PokedexColors.innerPokedexScreenButton,
          ),
        ),
      );
}
