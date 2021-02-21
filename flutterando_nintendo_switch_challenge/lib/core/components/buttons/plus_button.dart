import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/clippers/plus_button_clipper.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: height,
        width: height,
        child: ClipPath(
          clipper: PlusButtonClipper(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.plusButtomBorder),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.plusButtomTop,
                  AppColors.plusButtomBottom,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
