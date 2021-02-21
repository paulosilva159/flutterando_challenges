import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: height,
        width: height * 3,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.minusButtomBorder),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.minusButtomTop,
              AppColors.minusButtomBottom,
            ],
          ),
        ),
      ),
    );
  }
}
