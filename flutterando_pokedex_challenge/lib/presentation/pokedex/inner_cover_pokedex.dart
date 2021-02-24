import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover_structure/bottom_displays.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover_structure/buttons_table.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover_structure/other_buttons.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover_structure/short_info_display.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/inner_cover_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class InnerCoverPokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height *
          Proportions.innerPokedexInsideContentHeightProportion /
          (Proportions.outerPokedexTopBarHeightProportion +
              Proportions.innerPokedexInsideContentHeightProportion),
      width: _size.width *
          Proportions.innerPokedexInsideContentWidthProportion /
          (Proportions.innerPokedexInsideContentWidthProportion +
              Proportions.outerPokedexRollerWidthProportion),
      child: CustomPaint(
        painter: InnerCoverPainter(
          color: PokedexColors.outerPokedexColor,
          gapColor: PokedexColors.outerShadowPokedexColor,
          innerColor: PokedexColors.innerPokedexColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: _size.height / 12, horizontal: _size.width / 9),
          child: Column(
            children: [
              Expanded(
                child: ShortInfoDisplay(
                  child: Container(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ButtonsTable(
                  buttonsCallback:
                      List<VoidCallback>.generate(10, (index) => () {}),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Expanded(
                child: OtherButtons(),
              ),
              BottomDisplays(
                leftDisplayChild: Container(),
                rightDisplayChild: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
