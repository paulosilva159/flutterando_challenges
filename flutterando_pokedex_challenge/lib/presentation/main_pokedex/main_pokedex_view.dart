import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/main_pokedex_structure/buttons_group.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/main_pokedex_structure/screen.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/pikachu.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class MainPokedexView extends StatelessWidget {
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
