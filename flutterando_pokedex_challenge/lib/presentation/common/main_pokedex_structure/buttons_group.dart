import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/main_pokedex_structure/big_rounded_button.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/main_pokedex_structure/directional_buttons_group.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/colored_button_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class ButtonsGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 5;
    final _size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: BigRoundedButton(height: radius),
          ),
          Container(
            width: _size.width / 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _SmallRedButton(),
                    _SmallBlueButton(),
                  ],
                ),
                SizedBox(
                  height: _size.height / 16,
                ),
                _BigGreenButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: DirectionalButtonsGroup(
              height: radius * 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BigGreenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height / 16,
      width: _size.width / 4,
      child: CustomPaint(
        painter: ColoredButtonPainter(
          innerColor: PokedexColors.innerBigGreenButtonColor,
          strokeColor: PokedexColors.outerBigGreenButtonColor,
        ),
      ),
    );
  }
}

class _SmallBlueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height / 84,
      width: _size.width / 12,
      child: CustomPaint(
        painter: ColoredButtonPainter(
          innerColor: PokedexColors.innerSmallBlueButtonColor,
          strokeColor: PokedexColors.outerSmallBlueButtonColor,
        ),
      ),
    );
  }
}

class _SmallRedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height / 84,
      width: _size.width / 12,
      child: CustomPaint(
        painter: ColoredButtonPainter(
          innerColor: PokedexColors.innerSmallRedButtonColor,
          strokeColor: PokedexColors.outerSmallRedButtonColor,
        ),
      ),
    );
  }
}
