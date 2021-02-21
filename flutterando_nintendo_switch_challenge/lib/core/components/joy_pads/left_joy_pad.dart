import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/buttons/big_rounded_button.dart';
import 'package:nintendo_swt/core/components/buttons/minus_button.dart';
import 'package:nintendo_swt/core/components/buttons/sound_button.dart';

import 'file:///D:/Projetos/Flutter/flutterando_nintendo_switch_challenge/lib/core/components/digital_buttons_group.dart';

class LeftJoyPadView extends StatelessWidget {
  const LeftJoyPadView({@required this.orientation, @required this.joyPadWidth})
      : assert(orientation != null),
        assert(joyPadWidth != null);

  final Orientation orientation;
  final double joyPadWidth;

  @override
  Widget build(BuildContext context) {
    final isVerticalView = orientation == Orientation.portrait;

    final minusButtonHeight = joyPadWidth / (isVerticalView ? 20 : 24);
    final buttonsGroupHeight = joyPadWidth / (isVerticalView ? 3 / 2 : 7 / 4);
    final bigRoundedButtonHeight = joyPadWidth / (isVerticalView ? 2 : 7 / 3);
    final soundButtonHeight = joyPadWidth / (isVerticalView ? 11 / 3 : 9 / 2);
    final topCornerRadius = joyPadWidth / (isVerticalView ? 7 / 6 : 1 / 2);

    return Container(
      width: joyPadWidth,
      decoration: BoxDecoration(
        color: AppColors.leftSide,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topCornerRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: MinusButton(
              height: minusButtonHeight,
            ),
          ),
          BigRoundedButton(
            height: bigRoundedButtonHeight,
          ),
          DigitalButtonsGroup(
            type: ButtonsGroupType.directional,
            height: buttonsGroupHeight,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SoundButton(
              height: soundButtonHeight,
            ),
          )
        ],
      ),
    );
  }
}
