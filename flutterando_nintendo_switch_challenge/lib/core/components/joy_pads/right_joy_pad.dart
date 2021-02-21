import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/buttons/big_rounded_button.dart';
import 'package:nintendo_swt/core/components/buttons/home_button.dart';
import 'package:nintendo_swt/core/components/buttons/plus_button.dart';

import 'file:///D:/Projetos/Flutter/flutterando_nintendo_switch_challenge/lib/core/components/digital_buttons_group.dart';

class RightJoyPadView extends StatelessWidget {
  const RightJoyPadView(
      {@required this.orientation, @required this.joyPadWidth})
      : assert(orientation != null),
        assert(joyPadWidth != null);

  final Orientation orientation;
  final double joyPadWidth;

  @override
  Widget build(BuildContext context) {
    final isVerticalView = orientation == Orientation.portrait;

    final plusButtonHeight = joyPadWidth / (isVerticalView ? 16 / 3 : 8);
    final buttonsGroupHeight = joyPadWidth / (isVerticalView ? 3 / 2 : 7 / 4);
    final bigRoundedButtonHeight = joyPadWidth / (isVerticalView ? 2 : 7 / 3);
    final homeButtonHeight = joyPadWidth / (isVerticalView ? 10 / 3 : 9 / 2);
    final topCornerRadius = joyPadWidth / (isVerticalView ? 7 / 6 : 1 / 2);

    return Container(
      width: joyPadWidth,
      decoration: BoxDecoration(
        color: AppColors.rightSide,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topCornerRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: PlusButton(
              height: plusButtonHeight,
            ),
          ),
          DigitalButtonsGroup(
            type: ButtonsGroupType.action,
            height: buttonsGroupHeight,
          ),
          BigRoundedButton(
            height: bigRoundedButtonHeight,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: HomeButton(
              height: homeButtonHeight,
            ),
          ),
        ],
      ),
    );
  }
}
