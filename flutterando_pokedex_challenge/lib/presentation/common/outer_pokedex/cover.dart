import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outer_pokedex/cover_button.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/cover_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class Cover extends StatefulWidget {
  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _rotationAnimation;
  Tween<double> _translationTween;

  Matrix4 _transform(double angle) => Matrix4.identity()
    ..setEntry(3, 2, 1 / 1000)
    ..rotateY(angle);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: -pi / 2);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _translationTween =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.width / 11);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Transform(
        alignment: FractionalOffset.topRight,
        transform: _transform(
          _rotationAnimation.evaluate(_controller),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: _translationTween.evaluate(_controller),
          ),
          child: Stack(
            children: [
              Container(
                height: _size.height * 11 / 14,
                width: _size.width * 10 / 11,
                child: CustomPaint(
                  painter: CoverPainter(
                    color: PokedexColors.outerPokedexColor,
                    gapColor: PokedexColors.outerShadowPokedexColor,
                  ),
                ),
              ),
              Positioned(
                top: _size.height / 3,
                left: 12,
                child: CoverButton(
                  height: _size.height / 12,
                  onLongPress: _controller.forward,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
