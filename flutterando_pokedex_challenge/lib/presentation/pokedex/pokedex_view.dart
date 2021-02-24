import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover_pokedex_structure.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/pokedex_structure.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/inner_cover_pokedex/inner_cover_pokedex_view.dart';
import 'package:flutterando_pokedex_challenge/presentation/main_pokedex/main_pokedex_view.dart';

class PokedexView extends StatefulWidget {
  @override
  _PokedexViewState createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);

  AnimationController _coverController;
  bool isCoverOpen = false;

  @override
  void initState() {
    _coverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isCoverOpen = true;
          });
        }
      });

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
              mainPokedex: MainPokedexView(),
            ),
            InnerCoverPokedexStructure(
              innerCoverPokedex: InnerCoverPokedex(),
              isCoverOpen: isCoverOpen,
            ),
          ],
        ),
      );
}
