import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    final _layer0Size = Size(height, height);
    final _layer1Size = Size(height * 4 / 5, height * 4 / 5);
    final _layer2Size = Size.fromRadius(height * 1.5 / 5);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _layer0Size.height,
            width: _layer0Size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.soundLayer0Top,
                  AppColors.soundLayer0Bottom,
                ],
              ),
            ),
          ),
          Container(
            height: _layer1Size.height,
            width: _layer1Size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.soundLayer1Top,
                  AppColors.soundLayer1Bottom,
                ],
              ),
            ),
          ),
          Container(
            height: _layer2Size.height,
            width: _layer2Size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.soundLayer2,
            ),
          ),
        ],
      ),
    );
  }
}
