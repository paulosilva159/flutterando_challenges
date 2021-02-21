import 'package:flutter/material.dart';

import '../core/colors/colors.dart';
import '../core/components/animated_logo.dart';

class DisplayView extends StatelessWidget {
  const DisplayView({@required this.orientation}) : assert(orientation != null);

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    final isVerticalView = orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.screen,
        ),
        child: AnimatedLogo(
          color: AppColors.bigLogo,
          width: MediaQuery.of(context).size.width / (isVerticalView ? 10 : 16),
        ),
      ),
    );
  }
}
