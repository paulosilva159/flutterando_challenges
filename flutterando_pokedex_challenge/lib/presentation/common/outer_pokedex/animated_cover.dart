import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outer_pokedex/outer_cover.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/proportions.dart';

class AnimatedCover extends AnimatedWidget {
  const AnimatedCover({
    @required this.controller,
    @required this.onButtonPress,
  })  : assert(controller != null),
        assert(onButtonPress != null),
        super(listenable: controller);

  final AnimationController controller;
  final VoidCallback onButtonPress;

  Matrix4 _transform(double angle) => Matrix4.identity()
    ..setEntry(3, 2, 1 / 1000)
    ..rotateY(angle);

  static final _rotationAnimation = Tween<double>(begin: 0, end: -pi / 2);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _translationTween = Tween<double>(
      begin: 0,
      end: _size.width /
          (Proportions.outerPokedexRollerWidthProportion +
              Proportions.innerPokedexInsideContentWidthProportion),
    );

    return Transform(
      alignment: FractionalOffset.topRight,
      transform: _transform(
        _rotationAnimation.evaluate(listenable),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: _translationTween.evaluate(listenable),
        ),
        child: OuterCover(
          size: _size,
          onButtonPress: onButtonPress,
        ),
      ),
    );
  }
}
