import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/outer_pokedex.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/outside_pokedex.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);

  AnimationController _coverController;

  @override
  void initState() {
    _coverController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: PokedexColors.innerPokedexColor,
        body: PageView(
          controller: _pageController,
          children: [
            OuterPokedex(
              coverController: _coverController,
              onCoverButtonPress: _coverController.forward,
            ),
            OutsidePokedex(),
          ],
        ),
      );
}
