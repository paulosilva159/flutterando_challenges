import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/lamp_group.dart';
import 'package:nintendo_swt/core/components/logo_icon.dart';

class InBetweenPads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LampGroup(
          isFirstLampOn: true,
        ),
        LogoIcon(
          color: AppColors.smallLogo,
          width: MediaQuery.of(context).size.height * 2.5 / 64,
        ),
        LampGroup(
          isFirstLampOn: false,
        ),
      ],
    );
  }
}
