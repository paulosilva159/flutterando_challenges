import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/screen_button.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_pokedex/screen_sound_button.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/screen_border_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class Screen extends StatelessWidget {
  const Screen({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 36;

    return CustomPaint(
      painter: ScreenBorderPainter(
          color: PokedexColors.innerPokedexScreenBorderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    radius,
                  ),
                  color: PokedexColors.innerPokedexScreenColor,
                ),
                child: child,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: radius * 4.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenButton(height: radius * 2),
                  ScreenSoundButton(height: radius * 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
