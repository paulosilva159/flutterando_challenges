import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/pikachu_painter.dart';

class Pikachu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: PikachuPainter(),
      );
}
