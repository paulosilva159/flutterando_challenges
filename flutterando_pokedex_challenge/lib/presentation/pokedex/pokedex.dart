import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/inner_cover_pokedex.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/main_pokedex.dart';

import 'file:///D:/Projetos/Flutter/flutterando_challenges/flutterando_pokedex_challenge/lib/presentation/common/inner_cover_pokedex_structure.dart';
import 'file:///D:/Projetos/Flutter/flutterando_challenges/flutterando_pokedex_challenge/lib/presentation/common/pokedex_structure.dart';

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
            PokedexStructure(
              coverController: _coverController,
              onCoverButtonPress: _coverController.forward,
              mainPokedex: MainPokedex(),
            ),
            InnerCoverPokedexStructure(
              innerCoverPokedex: InnerCoverPokedex(),
            ),
          ],
        ),
      );
}
