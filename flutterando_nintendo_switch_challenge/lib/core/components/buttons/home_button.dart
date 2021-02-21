import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    final _layer0Size = Size.fromRadius(height / 2);
    final _layer1Size = Size.fromRadius(height * 4 / 10);

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _layer0Size.height,
            width: _layer0Size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.homeLayer0Border,
                ),
                shape: BoxShape.circle,
                color: AppColors.homeLayer0Top),
          ),
          Container(
            height: _layer1Size.height,
            width: _layer1Size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.homeLayer1Border,
                ),
                shape: BoxShape.circle,
                color: AppColors.homeLayer1Top),
            child: Center(
              child: Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
