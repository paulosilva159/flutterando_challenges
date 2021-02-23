import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outside_background.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/inner_cover_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/right_roller_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class OutsidePokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: Proportions.outerPokedexTopBarHeightProportion,
            child: OutsideBackground(),
          ),
          Expanded(
            flex: Proportions.innerPokedexInsideContentHeightProportion,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: Proportions.outerPokedexRollerWidthProportion,
                  child: CustomPaint(
                    painter: RightRollerPainter(
                      color: PokedexColors.outerPokedexColor,
                      gapColor: PokedexColors.outerShadowPokedexColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: Proportions.innerPokedexInsideContentWidthProportion,
                  child: InnerCover(
                    size: _size,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InnerCover extends StatelessWidget {
  const InnerCover({@required this.size}) : assert(size != null);

  final Size size;

  @override
  Widget build(BuildContext context) => Container(
        height: size.height *
            Proportions.innerPokedexInsideContentHeightProportion /
            (Proportions.outerPokedexTopBarHeightProportion +
                Proportions.innerPokedexInsideContentHeightProportion),
        width: size.width *
            Proportions.innerPokedexInsideContentWidthProportion /
            (Proportions.innerPokedexInsideContentWidthProportion +
                Proportions.outerPokedexRollerWidthProportion),
        child: CustomPaint(
          painter: InnerCoverPainter(
            color: PokedexColors.outerPokedexColor,
            gapColor: PokedexColors.outerShadowPokedexColor,
          ),
        ),
      );
}
