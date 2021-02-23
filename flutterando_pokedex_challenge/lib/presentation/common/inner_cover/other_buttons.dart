import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/glass_crystal_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class OtherButtons extends StatelessWidget {
  const OtherButtons({
    this.leftButtonCallback,
    this.rightButtonCallback,
  });

  final VoidCallback leftButtonCallback;
  final VoidCallback rightButtonCallback;

  @override
  Widget build(BuildContext context) {
    final glassCrystalRadius = MediaQuery.of(context).size.width / 12;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _WhiteButtonsPair(
          leftButtonCallback: leftButtonCallback,
          rightButtonCallback: rightButtonCallback,
        ),
        CustomPaint(
          size: Size(
            glassCrystalRadius,
            glassCrystalRadius,
          ),
          painter: GlassCrystalPainter(
            gradientColor: [
              PokedexColors.brighterSmallerYellowGlassCrystalColor,
              PokedexColors.innerSmallerYellowGlassCrystalColor,
              PokedexColors.outerSmallerYellowGlassCrystalColor,
            ],
          ),
        ),
      ],
    );
  }
}

class _WhiteButtonsPair extends StatelessWidget {
  const _WhiteButtonsPair({
    this.leftButtonCallback,
    this.rightButtonCallback,
  });

  final VoidCallback leftButtonCallback;
  final VoidCallback rightButtonCallback;

  @override
  Widget build(BuildContext context) => Row(
        children: const [
          _WhiteButton(),
          _WhiteButton(),
        ],
      );
}

class _WhiteButton extends StatelessWidget {
  const _WhiteButton({this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        height: _size.height / 14,
        width: _size.width / 6,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
            color: Colors.white),
      ),
    );
  }
}
