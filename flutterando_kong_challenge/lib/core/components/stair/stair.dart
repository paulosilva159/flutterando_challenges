import 'package:flutter/material.dart';

import 'stair_bot_widget.dart';
import 'stair_mid_widget.dart';
import 'stair_top_widget.dart';

class Stair extends StatelessWidget {
  const Stair({
    @required this.stairStepSize,
    this.stairStepsQuantity = 1,
  });

  final Size stairStepSize;
  final int stairStepsQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StairTopWidget(
          size: stairStepSize,
        ),
        ...List.generate(
          stairStepsQuantity,
          (index) => StairMidWidget(
            size: stairStepSize,
          ),
        ),
        StairBotWidget(
          size: stairStepSize,
        ),
      ],
    );
  }
}
