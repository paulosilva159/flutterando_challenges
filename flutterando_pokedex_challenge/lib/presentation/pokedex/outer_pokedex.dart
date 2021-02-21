import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outer_pokedex/cover.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/glass_crystal_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/roller_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/top_bar_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class OuterPokedex extends StatelessWidget {
  const OuterPokedex({
    @required this.innerPokedex,
  }) : assert(innerPokedex != null);

  final Widget innerPokedex;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final biggerGlassCrystalRadius = _size.height / 9;
    final smallerGlassCrystalRadius = biggerGlassCrystalRadius / 6;

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomPaint(
            painter: TopBarPainter(
              barColor: PokedexColors.outerPokedexColor,
              shadowColor: PokedexColors.outerShadowPokedexColor,
            ),
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(
                    size: Size(
                      biggerGlassCrystalRadius,
                      biggerGlassCrystalRadius,
                    ),
                    painter: GlassCrystalPainter(
                      gradientColor: [
                        PokedexColors.brighterBiggerGlassCrystalColor,
                        PokedexColors.innerBiggerGlassCrystalColor,
                        PokedexColors.outerBiggerGlassCrystalColor,
                      ],
                      hasOuterRing: true,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomPaint(
                    size: Size(
                      smallerGlassCrystalRadius,
                      smallerGlassCrystalRadius,
                    ),
                    painter: GlassCrystalPainter(
                      gradientColor: [
                        PokedexColors.brighterSmallerRedGlassCrystalColor,
                        PokedexColors.innerSmallerRedGlassCrystalColor,
                        PokedexColors.outerSmallerRedGlassCrystalColor,
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomPaint(
                    size: Size(
                      smallerGlassCrystalRadius,
                      smallerGlassCrystalRadius,
                    ),
                    painter: GlassCrystalPainter(
                      gradientColor: [
                        PokedexColors.brighterSmallerYellowGlassCrystalColor,
                        PokedexColors.innerSmallerYellowGlassCrystalColor,
                        PokedexColors.outerSmallerYellowGlassCrystalColor,
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomPaint(
                    size: Size(
                      smallerGlassCrystalRadius,
                      smallerGlassCrystalRadius,
                    ),
                    painter: GlassCrystalPainter(
                      gradientColor: [
                        PokedexColors.brighterSmallerGreenGlassCrystalColor,
                        PokedexColors.innerSmallerGreenGlassCrystalColor,
                        PokedexColors.outerSmallerGreenGlassCrystalColor,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 11,
          child: Container(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 10,
                      child: innerPokedex,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomPaint(
                        painter: RollerPainter(
                          color: PokedexColors.outerPokedexColor,
                          gapColor: PokedexColors.outerShadowPokedexColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Cover(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
