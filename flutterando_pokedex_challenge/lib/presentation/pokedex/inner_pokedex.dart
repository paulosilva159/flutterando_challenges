import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/buttons_group.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/screen.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/pikachu_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class InnerPokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          flex: Proportions.innerPokedexScreenGroupHeightProportion,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _size.width / 16,
              vertical: _size.width / 12,
            ),
            child: Screen(
              child: Pikachu(),
            ),
          ),
        ),
        Expanded(
          flex: Proportions.innerPokedexButtonsGroupHeightProportion,
          child: ButtonsGroup(),
        )
      ],
    );
  }
}

class Pikachu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: PikachuPainter(),
      );
}
