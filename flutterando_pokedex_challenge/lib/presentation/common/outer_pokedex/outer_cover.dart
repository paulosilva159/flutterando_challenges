import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outer_pokedex/cover_button.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/outer_cover_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class OuterCover extends StatelessWidget {
  const OuterCover({@required this.size, @required this.onButtonPress})
      : assert(size != null),
        assert(onButtonPress != null);

  final Size size;
  final VoidCallback onButtonPress;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            height: size.height,
            width: size.width * 10 / 11,
            child: CustomPaint(
              painter: OuterCoverPainter(
                color: PokedexColors.outerPokedexColor,
                gapColor: PokedexColors.outerShadowPokedexColor,
              ),
            ),
          ),
          Positioned(
            top: size.height / 3,
            left: 12,
            child: CoverButton(
              height: size.height / 12,
              onLongPress: onButtonPress,
            ),
          ),
        ],
      );
}
