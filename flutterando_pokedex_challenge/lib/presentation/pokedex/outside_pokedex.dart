import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outside_background.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/inner_cover_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/right_roller_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class OutsidePokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: OutsideBackground(),
          ),
          Expanded(
            flex: 11,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: RightRollerPainter(
                      color: PokedexColors.outerPokedexColor,
                      gapColor: PokedexColors.outerShadowPokedexColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 13,
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
        height: size.height * 11 / 14,
        width: size.width * 10 / 11,
        child: CustomPaint(
          painter: InnerCoverPainter(
            color: PokedexColors.outerPokedexColor,
            gapColor: PokedexColors.outerShadowPokedexColor,
          ),
        ),
      );
}
