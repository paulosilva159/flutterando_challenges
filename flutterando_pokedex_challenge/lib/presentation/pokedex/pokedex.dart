import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/inner_pokedex.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/outer_pokedex.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: PokedexColors.innerPokedexColor,
        body: OuterPokedex(
          innerPokedex: InnerPokedex(),
        ),
      );
}
