import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/buttons_group.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/screen.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/pikachu_painter.dart';

class InnerPokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Screen(
                child: Pikachu(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ButtonsGroup(),
          )
        ],
      );
}

class Pikachu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return CustomPaint(
      painter: PikachuPainter(),
    );
  }
}
