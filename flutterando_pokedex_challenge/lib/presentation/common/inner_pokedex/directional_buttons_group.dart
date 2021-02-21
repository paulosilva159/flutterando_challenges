import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/directional_buttons_group_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class DirectionalButtonsGroup extends StatelessWidget {
  const DirectionalButtonsGroup({@required this.height})
      : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: height,
        child: CustomPaint(
          painter: DirectionalButtonsGroupPainter(
            colorList: [
              PokedexColors.topLeftDirectionalButtonsColor,
              PokedexColors.bottomRightDirectionalButtonsColor,
            ],
          ),
        ),
      );
}
