import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/cover_structure/animated_cover.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/glass_crystal_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/left_roller_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/top_bar_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class PokedexStructure extends StatelessWidget {
  const PokedexStructure({
    @required this.coverController,
    @required this.onCoverButtonPress,
    @required this.mainPokedex,
  })  : assert(coverController != null),
        assert(onCoverButtonPress != null),
        assert(mainPokedex != null);

  final AnimationController coverController;
  final VoidCallback onCoverButtonPress;
  final Widget mainPokedex;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final biggerGlassCrystalRadius = _size.height / 9;
    final smallerGlassCrystalRadius = biggerGlassCrystalRadius / 6;

    return Column(
      children: [
        Expanded(
          flex: Proportions.outerPokedexTopBarHeightProportion,
          child: CustomPaint(
            painter: TopBarPainter(
              barColor: PokedexColors.outerPokedexColor,
              shadowColor: PokedexColors.outerShadowPokedexColor,
            ),
            child: Container(
              padding: EdgeInsets.all(_size.height / 24),
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
          flex: Proportions.innerPokedexInsideContentHeightProportion,
          child: Container(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex:
                          Proportions.innerPokedexInsideContentWidthProportion,
                      child: mainPokedex,
                    ),
                    Expanded(
                      flex: Proportions.outerPokedexRollerWidthProportion,
                      child: CustomPaint(
                        painter: LeftRollerPainter(
                          color: PokedexColors.outerPokedexColor,
                          gapColor: PokedexColors.outerShadowPokedexColor,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedCover(
                  controller: coverController,
                  onButtonPress: onCoverButtonPress,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
