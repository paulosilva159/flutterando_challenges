import 'package:flutter/material.dart';

import '../core/components/lattice/lattice_widget.dart';

class LatticeView extends StatelessWidget {
  const LatticeView({
    @required this.latticeSize,
    this.stairStepHeight = 12,
  });

  final Size latticeSize;
  final double stairStepHeight;

  Widget floorRowGenerator(
    int latticeQuantity, {
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
  }) =>
      Row(
        mainAxisAlignment: rowMainAxisAlignment,
        children: List.generate(
          latticeQuantity,
          (index) => LatticeWidget(
            size: latticeSize,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final topFloorLatticeQuantity = 5;
    final thirdFloorLatticeQuantity = 10;
    final secondFloorLatticeQuantity = 6;
    final firstFloorLatticeQuantity = 10;

    return Column(
      children: [
        SizedBox(
          height: stairStepHeight * 5 + stairStepHeight * 2,
        ),
        floorRowGenerator(
          topFloorLatticeQuantity,
          rowMainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: stairStepHeight * 3 + stairStepHeight * 2,
        ),
        floorRowGenerator(
          thirdFloorLatticeQuantity,
        ),
        SizedBox(
          height: stairStepHeight * 6 + stairStepHeight * 2,
        ),
        floorRowGenerator(
          secondFloorLatticeQuantity,
          rowMainAxisAlignment: MainAxisAlignment.end,
        ),
        SizedBox(
          height: stairStepHeight * 6 + stairStepHeight * 2,
        ),
        floorRowGenerator(
          firstFloorLatticeQuantity,
        ),
      ],
    );
  }
}
