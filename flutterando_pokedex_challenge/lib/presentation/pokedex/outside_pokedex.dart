import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outside_background.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/right_roller_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/inner_cover.dart';

class OutsidePokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
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
                      tableButtonsCallnack: const [
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                        fakeCallback,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

void fakeCallback() {}
