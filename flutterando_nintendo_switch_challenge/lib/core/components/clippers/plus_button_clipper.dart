import 'package:flutter/material.dart';

class PlusButtonClipper extends CustomClipper<Path> {
  final edgeSize = 8.0;

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, edgeSize);
    path.lineTo(0, edgeSize * 2);
    path.lineTo(edgeSize, edgeSize * 2);
    path.lineTo(edgeSize, edgeSize * 3);
    path.lineTo(edgeSize * 2, edgeSize * 3);
    path.lineTo(edgeSize * 2, edgeSize * 2);
    path.lineTo(edgeSize * 3, edgeSize * 2);
    path.lineTo(edgeSize * 3, edgeSize);
    path.lineTo(edgeSize * 2, edgeSize);
    path.lineTo(edgeSize * 2, 0);
    path.lineTo(edgeSize, 0);
    path.lineTo(edgeSize, edgeSize);
    path.lineTo(0, edgeSize);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
