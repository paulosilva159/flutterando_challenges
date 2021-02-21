import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class ScreenSoundButton extends StatelessWidget {
  const ScreenSoundButton({@required this.height}) : assert(height != null);

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  PokedexColors.soundButtonLayer0Top,
                  PokedexColors.soundButtonLayer0Bottom,
                ],
              ),
            ),
          ),
          Container(
            height: _layer1Size.height,
            width: _layer1Size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  PokedexColors.soundButtonLayer1Top,
                  PokedexColors.soundButtonLayer1Bottom,
                ],
              ),
            ),
          ),
          Container(
            height: _layer2Size.height,
            width: _layer2Size.width,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: PokedexColors.soundButtonLayer2,
            ),
          ),
        ],
      ),
    );
  }
}
