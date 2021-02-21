import 'dart:math';

import 'package:flutter/material.dart';

class LogoRightPadClipper extends CustomClipper<Path> {
  LogoRightPadClipper({@required this.customSize}) : assert(customSize != null);

  final Size customSize;

  @override
  Path getClip(Size size) => Path()
    ..lineTo(customSize.width / 2, 0)
    ..lineTo(customSize.width / 2, customSize.height)
    ..lineTo(0, customSize.height)
    ..lineTo(0, 0)
    ..moveTo(customSize.width / 2, 0)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.width / 2,
        ),
        radius: customSize.width / 2,
      ),
      -pi / 2,
      pi / 2,
    )
    ..lineTo(customSize.width, customSize.height - customSize.width / 2)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.height - customSize.width / 2,
        ),
        radius: customSize.width / 2,
      ),
      0,
      pi / 2,
    )
    ..lineTo(customSize.width / 2, 0)
    ..fillType = PathFillType.evenOdd
    ..addOval(
      Rect.fromCircle(
          center: Offset(customSize.width / 2,
              customSize.height / 2 + customSize.width / 8),
          radius: customSize.width / 5),
    );

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class LogoLeftPadClipper extends CustomClipper<Path> {
  LogoLeftPadClipper({@required this.customSize}) : assert(customSize != null);

  final Size customSize;

  @override
  Path getClip(Size size) => Path()
    ..fillType = PathFillType.evenOdd
    ..moveTo(customSize.width / 2, 0)
    ..lineTo(customSize.width, 0)
    ..lineTo(customSize.width, customSize.height)
    ..lineTo(customSize.width * 5 / 6, customSize.height)
    ..lineTo(customSize.width * 5 / 6, customSize.width / 6)
    ..lineTo(customSize.width / 2, customSize.width / 6)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.width / 2,
        ),
        radius: customSize.width / 2,
      ),
      -pi / 2,
      -pi / 2,
    )
    ..lineTo(customSize.width / 6, customSize.width / 2)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.width / 2,
        ),
        radius: customSize.width / 3,
      ),
      -pi / 2,
      -pi / 2,
    )
    ..lineTo(customSize.width / 2, 0)
    ..moveTo(0, customSize.width / 2)
    ..lineTo(0, customSize.height - customSize.width / 2)
    ..lineTo(customSize.width / 6, customSize.height - customSize.width / 2)
    ..lineTo(customSize.width / 6, customSize.width / 2)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.height - customSize.width / 2,
        ),
        radius: customSize.width / 2,
      ),
      -pi,
      -pi / 2,
    )
    ..lineTo(customSize.width / 2, customSize.height - customSize.width / 6)
    ..addArc(
      Rect.fromCircle(
        center: Offset(
          customSize.width / 2,
          customSize.height - customSize.width / 2,
        ),
        radius: customSize.width / 3,
      ),
      -pi,
      -pi / 2,
    )
    ..lineTo(0, customSize.height - customSize.width / 2)
    ..moveTo(customSize.width / 2, customSize.height)
    ..lineTo(customSize.width * 5 / 6, customSize.height)
    ..lineTo(customSize.width * 5 / 6, customSize.height - customSize.width / 6)
    ..lineTo(customSize.width / 2, customSize.height - customSize.width / 6)
    ..addOval(
      Rect.fromCircle(
          center: Offset(customSize.width / 2, customSize.height / 3),
          radius: customSize.width / 5),
    );

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
