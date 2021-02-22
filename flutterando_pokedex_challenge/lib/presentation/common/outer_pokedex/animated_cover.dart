import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/outer_pokedex/outer_cover.dart';

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

    final _translationTween =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.width / 12);

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

// class AnimatedCover extends StatefulWidget {
//   @override
//   _AnimatedCoverState createState() => _AnimatedCoverState();
// }
//
// class _AnimatedCoverState extends State<AnimatedCover>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Tween<double> _rotationAnimation;
//   Tween<double> _translationTween;
//
//   Matrix4 _transform(double angle) => Matrix4.identity()
//     ..setEntry(3, 2, 1 / 1000)
//     ..rotateY(angle);
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//
//     _rotationAnimation = Tween<double>(begin: 0, end: -pi / 2);
//
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     _translationTween =
//         Tween<double>(begin: 0, end: MediaQuery.of(context).size.width / 11);
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) => Transform(
//         alignment: FractionalOffset.topRight,
//         transform: _transform(
//           _rotationAnimation.evaluate(_controller),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: _translationTween.evaluate(_controller),
//           ),
//           child: child,
//         ),
//       ),
//       child: Cover(
//         size: _size,
//         onButtonPress: _controller.forward,
//       ),
//     );
//   }
// }
