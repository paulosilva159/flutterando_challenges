import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/joy_pads/left_joy_pad.dart';
import 'package:nintendo_swt/core/components/joy_pads/right_joy_pad.dart';
import 'package:nintendo_swt/screens/display_view.dart';

import 'file:///D:/Projetos/Flutter/flutterando_nintendo_switch_challenge/lib/core/components/joy_pads/in_between_pads.dart';

class NintendoScreen extends StatefulWidget {
  @override
  _NintendoScreenState createState() => _NintendoScreenState();
}

class _NintendoScreenState extends State<NintendoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.bgScreenTop,
                  AppColors.bgScreenBottom,
                ],
              ),
            ),
            child: orientation == Orientation.portrait
                ? NintendoScreenPortraitView()
                : NintendoScreenLandscapeView(),
          );
        },
      ),
    );
  }
}

class NintendoScreenLandscapeView extends StatelessWidget {
  final orientation = Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    final joyPadWidth = MediaQuery.of(context).size.width / 4;

    return Row(
      children: [
        Expanded(
          child: LeftJoyPadView(
            joyPadWidth: joyPadWidth,
            orientation: orientation,
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: DisplayView(
              orientation: orientation,
            ),
          ),
        ),
        Expanded(
          child: RightJoyPadView(
            joyPadWidth: joyPadWidth,
            orientation: orientation,
          ),
        ),
      ],
    );
  }
}

class NintendoScreenPortraitView extends StatelessWidget {
  final orientation = Orientation.portrait;

  @override
  Widget build(BuildContext context) {
    final joyPadWidth = MediaQuery.of(context).size.width / 3;

    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: DisplayView(
              orientation: orientation,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeftJoyPadView(
                joyPadWidth: joyPadWidth,
                orientation: orientation,
              ),
              Expanded(
                child: InBetweenPads(),
              ),
              RightJoyPadView(
                joyPadWidth: joyPadWidth,
                orientation: orientation,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
