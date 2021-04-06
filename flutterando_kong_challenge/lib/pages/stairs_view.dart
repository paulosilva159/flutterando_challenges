import 'package:flutter/material.dart';
import 'package:kong/core/components/stair/stair.dart';

class StairsView extends StatelessWidget {
  const StairsView({
    @required this.stairStepSize,
  });

  final Size stairStepSize;

  @override
  Widget build(BuildContext context) {
    final stairStepWidth = stairStepSize.width;
    final stairStepHeight = stairStepSize.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: stairStepWidth * 2),
          child: Stair(
            stairStepSize: stairStepSize,
            stairStepsQuantity: 12,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: stairStepHeight * 7,
            ),
            Padding(
              padding: EdgeInsets.only(left: stairStepWidth * 3),
              child: Stair(
                stairStepSize: stairStepSize,
                stairStepsQuantity: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: stairStepWidth * 5),
              child: Stair(
                stairStepSize: stairStepSize,
                stairStepsQuantity: 8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: stairStepWidth * 3),
              child: Stair(
                stairStepSize: stairStepSize,
                stairStepsQuantity: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
