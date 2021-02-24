import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class BigRoundedButton extends StatelessWidget {
  const BigRoundedButton({@required this.height}) : assert(height != null);

  final double height;

  @override
  Widget build(BuildContext context) {
    final _layer0Size = Size.fromRadius(height / 2);
    final _layer1Size = Size.fromRadius(height * 4 / 10);
    final _layer2Size = Size.fromRadius(height * 3.5 / 10);

    return Container(
      alignment: Alignment.center,
      height: _layer0Size.height,
      width: _layer0Size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: PokedexColors.bigButtonLayerBorder,
        ),
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            PokedexColors.bigButtonLayer0Top,
            PokedexColors.bigButtonLayer0Bottom,
          ],
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: _layer1Size.height,
        width: _layer1Size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: PokedexColors.bigButtonLayerBorder,
          ),
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              PokedexColors.bigButtonLayer1Top,
              PokedexColors.bigButtonLayer1Bottom,
            ],
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          height: _layer2Size.height,
          width: _layer2Size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: PokedexColors.bigButtonLayerBorder,
            ),
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                PokedexColors.bigButtonLayer2Top,
                PokedexColors.bigButtonLayer2Bottom,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
