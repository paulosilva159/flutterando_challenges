import 'dart:math';

import 'package:flutter/material.dart';

class PikachuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawPikachuTail(canvas, size);
    drawPikachuHead(canvas, size);
    drawPikachuLeftEarBlack(canvas, size);
    drawPikachuRightEarBlack(canvas, size);
    drawPikachuLeftCheek(canvas, size);
    drawPikachuRightCheek(canvas, size);
    drawPikachuMouth(canvas, size);
    drawPikachuLeftArm(canvas, size);
    drawPikachuRightArm(canvas, size);
    drawPikachuNoise(canvas, size);
    drawPikachuLeftEye(canvas, size);
    drawPikachuRightEye(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void drawPikachuTail(Canvas canvas, Size size) {
  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4
    ..color = Colors.black;
  final paint = Paint()..color = Colors.yellow;

  final path = Path()
    ..moveTo(0, size.height / 12)
    ..relativeLineTo(size.width / 10, size.height / 2)
    ..relativeLineTo(size.width * 1.5 / 10, size.height / 12)
    ..relativeLineTo(-size.width / 20, size.height / 6)
    ..lineTo(size.width / 2, size.height)
    ..lineTo(size.width / 2, size.height * 2 / 3)
    ..close();

  canvas..drawPath(path, paint)..drawPath(path, strokePaint);
}

void drawPikachuLeftArm(Canvas canvas, Size size) {
  final leftArmCenter = Offset(size.width / 2 - size.width / 10, size.height);

  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black;
  final paint = Paint()..color = Colors.yellow;

  final rect = Rect.fromCenter(
    center: leftArmCenter,
    height: size.height / 6,
    width: size.width / 5,
  );

  Matrix4 matrix4(double angle) => Matrix4.identity()
    ..translate(leftArmCenter.dx, leftArmCenter.dy)
    ..rotateZ(angle)
    ..translate(-leftArmCenter.dx, -leftArmCenter.dy);

  canvas
    ..transform(matrix4(-pi / 6).storage)
    ..drawOval(rect, paint)
    ..drawOval(rect, strokePaint)
    ..transform(matrix4(pi / 6).storage);
}

void drawPikachuRightArm(Canvas canvas, Size size) {
  final leftArmCenter =
      Offset(size.width / 2 + size.width / 10, size.height - size.height / 18);

  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black;
  final paint = Paint()..color = Colors.yellow;

  final rect = Rect.fromCenter(
    center: leftArmCenter,
    height: size.height * .85 / 6,
    width: size.width / 5,
  );

  Matrix4 matrix4(double angle) => Matrix4.identity()
    ..translate(leftArmCenter.dx, leftArmCenter.dy)
    ..rotateZ(angle)
    ..translate(-leftArmCenter.dx, -leftArmCenter.dy);

  canvas
    ..transform(matrix4(-pi / 12).storage)
    ..drawOval(rect, paint)
    ..drawOval(rect, strokePaint)
    ..transform(matrix4(pi / 12).storage);
}

void drawPikachuHead(Canvas canvas, Size size) {
  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black;

  final paint = Paint()..color = Colors.yellow;

  final rect = Rect.fromCenter(
    center: headCenter,
    height: size.height / 2,
    width: size.width / 2.5,
  );

  final path = Path()
    ..moveTo(headCenter.dx + halfHeadWidth, headCenter.dy)
    ..arcTo(rect, 0, pi + pi / 6, false)
    ..quadraticBezierTo(
      headCenter.dx / 2 - halfHeadWidth * .5,
      headCenter.dy / 2,
      headCenter.dx / 2 - halfHeadWidth / 3.5,
      headCenter.dy / 2 - halfHeadHeight / 3.5,
    )
    ..quadraticBezierTo(
      headCenter.dx / 2 + halfHeadWidth / 5,
      headCenter.dy / 2 - halfHeadHeight / 3.5,
      headCenter.dx - halfHeadWidth * sin(pi / 6),
      headCenter.dy - halfHeadHeight * cos(pi / 6),
    )
    ..arcTo(rect, pi + pi / 3, pi / 3, false)
    ..quadraticBezierTo(
      headCenter.dx / 2 + halfHeadWidth * 2,
      headCenter.dy / 3.5,
      headCenter.dx + halfHeadWidth * 1,
      headCenter.dy / 4 + halfHeadHeight * .5,
    )
    ..quadraticBezierTo(
      headCenter.dx + halfHeadWidth * 1.25,
      headCenter.dy / 3 + halfHeadHeight * .75,
      headCenter.dx + halfHeadWidth * sin(pi / 3),
      headCenter.dy - halfHeadHeight * cos(pi / 3),
    )
    ..arcTo(rect, -pi / 6, pi / 6, false);

  canvas..drawPath(path, paint)..drawPath(path, strokePaint);
}

void drawPikachuLeftEarBlack(Canvas canvas, Size size) {
  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final path = Path()
    ..moveTo(
      headCenter.dx - size.width / 5 - halfHeadWidth / 16,
      headCenter.dy - halfHeadHeight / 1.3,
    )
    ..quadraticBezierTo(
      headCenter.dx - size.width / 4,
      headCenter.dy - halfHeadHeight * 1.25,
      headCenter.dx / 2 + halfHeadWidth / 2.75,
      headCenter.dy / 2 + halfHeadHeight / 10,
    )
    ..quadraticBezierTo(
      headCenter.dx / 2,
      headCenter.dy / 2 - halfHeadHeight / 4,
      headCenter.dx / 2 - halfHeadWidth / 3.5,
      headCenter.dy / 2 - halfHeadHeight / 3.5,
    )
    ..quadraticBezierTo(
      headCenter.dx / 2 - halfHeadWidth * .5,
      headCenter.dy / 2,
      headCenter.dx - size.width / 4,
      headCenter.dy - halfHeadHeight,
    );

  final paint = Paint()..color = Colors.black;

  canvas.drawPath(path, paint);
}

void drawPikachuRightEarBlack(Canvas canvas, Size size) {
  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final path = Path()
    ..moveTo(
      headCenter.dx + size.width / 5 + halfHeadWidth / 12,
      headCenter.dy - halfHeadHeight * 1,
    )
    ..quadraticBezierTo(
      headCenter.dx + halfHeadWidth * 1.25,
      headCenter.dy / 4 + halfHeadHeight * .5,
      headCenter.dx + halfHeadWidth * .85,
      headCenter.dy / 3 + halfHeadHeight * .15,
    )
    ..quadraticBezierTo(
      headCenter.dx / 2 + halfHeadWidth * 1.95,
      headCenter.dy / 2 - halfHeadHeight / 4,
      headCenter.dx + halfHeadWidth / 1.7,
      headCenter.dy / 3 + halfHeadHeight / 1.2,
    )
    ..quadraticBezierTo(
      headCenter.dx + halfHeadWidth / 1.25,
      headCenter.dy / 3 + halfHeadHeight / 4,
      headCenter.dx + size.width / 5 + halfHeadWidth / 12,
      headCenter.dy - halfHeadHeight * 1,
    )
    ..close();

  final paint = Paint()..color = Colors.black;

  canvas.drawPath(path, paint);
}

void drawPikachuLeftCheek(Canvas canvas, Size size) {
  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  const startingAngle = pi / 2 + pi / 6;

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final rect = Rect.fromCenter(
    center: headCenter,
    height: size.height / 2,
    width: size.width / 2.5,
  );

  final cheekRect = Rect.fromCircle(
    center: Offset(
      headCenter.dx + halfHeadWidth * cos(startingAngle + pi / 12),
      headCenter.dy + halfHeadHeight * sin(startingAngle + pi / 12),
    ),
    radius: size.height / 15,
  );

  final path = Path()
    ..moveTo(
      headCenter.dx + halfHeadWidth * cos(startingAngle),
      headCenter.dy + halfHeadHeight * sin(startingAngle),
    )
    ..arcTo(rect, startingAngle, pi / 6, false)
    // ..lineTo(headCenter.dx, headCenter.dy)
    ..arcTo(cheekRect, pi + pi / 3, pi - pi / 3, false)
    ..close();

  final paint = Paint()..color = Colors.pink;

  canvas.drawPath(path, paint);
}

void drawPikachuRightCheek(Canvas canvas, Size size) {
  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  const startingAngle = pi / 12;

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final rect = Rect.fromCenter(
    center: headCenter,
    height: size.height / 2,
    width: size.width / 2.5,
  );

  final cheekRect = Rect.fromCircle(
    center: Offset(
      headCenter.dx + halfHeadWidth * cos(startingAngle + pi / 12),
      headCenter.dy + halfHeadHeight * sin(startingAngle + pi / 12),
    ),
    radius: size.height / 15,
  );

  final path = Path()
    ..moveTo(
      headCenter.dx + halfHeadWidth * cos(startingAngle),
      headCenter.dy + halfHeadHeight * sin(startingAngle),
    )
    ..arcTo(rect, startingAngle, pi / 6, false)
    // ..lineTo(headCenter.dx, headCenter.dy)
    ..arcTo(cheekRect, pi / 2 + pi / 3, pi - pi / 6, false)
    ..close();

  final paint = Paint()..color = Colors.pink;

  canvas.drawPath(path, paint);
}

void drawPikachuMouth(Canvas canvas, Size size) {
  final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.25
    ..color = Colors.black;

  final mouthRadius = size.width / 36;

  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final leftPath = Path()
    ..moveTo(headCenter.dx, headCenter.dy + mouthRadius)
    ..relativeMoveTo(-2 * mouthRadius, 0)
    ..relativeQuadraticBezierTo(mouthRadius, mouthRadius, 2 * mouthRadius, 0);

  final rightPath = Path()
    ..moveTo(headCenter.dx, headCenter.dy + mouthRadius)
    ..relativeQuadraticBezierTo(mouthRadius, mouthRadius, 2 * mouthRadius, 0);

  canvas
    ..drawArc(leftPath.getBounds(), pi, -pi, false, paint)
    ..drawArc(rightPath.getBounds(), pi, -pi, false, paint);
}

void drawPikachuNoise(Canvas canvas, Size size) {
  final paint = Paint()..color = Colors.black;

  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final rect = Rect.fromCenter(
    center: Offset(headCenter.dx, headCenter.dy * 19 / 18),
    height: 2,
    width: 6,
  );

  canvas.drawOval(rect, paint);
}

void drawPikachuLeftEye(Canvas canvas, Size size) {
  final biggerEyePaint = Paint()..color = Colors.black;
  final smallerEyePaint = Paint()..color = Colors.white;

  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final biggerEyeRadius = size.width / 30;
  final smallerEyeRadius = size.width / 75;

  final biggerEyeOffset = Offset(
    headCenter.dx - halfHeadWidth / 2,
    headCenter.dy,
  );

  final smallerEyeOffset = Offset(
    headCenter.dx - halfHeadWidth / 2.1,
    headCenter.dy - halfHeadHeight / 12,
  );

  final biggerEyeRect = Rect.fromCircle(
    center: biggerEyeOffset,
    radius: biggerEyeRadius,
  );

  final smallerEyeRect = Rect.fromCircle(
    center: smallerEyeOffset,
    radius: smallerEyeRadius,
  );

  canvas
    ..drawOval(biggerEyeRect, biggerEyePaint)
    ..drawOval(smallerEyeRect, smallerEyePaint);
}

void drawPikachuRightEye(Canvas canvas, Size size) {
  final biggerEyePaint = Paint()..color = Colors.black;
  final smallerEyePaint = Paint()..color = Colors.white;

  final headCenter = Offset(size.width / 2, size.height * 3 / 4);

  final halfHeadWidth = size.width / 5;
  final halfHeadHeight = size.height / 4;

  final biggerEyeRadius = size.width / 30;
  final smallerEyeRadius = size.width / 75;

  final biggerEyeOffset = Offset(
    headCenter.dx + halfHeadWidth / 2,
    headCenter.dy,
  );

  final smallerEyeOffset = Offset(
    headCenter.dx + halfHeadWidth / 2.1,
    headCenter.dy - halfHeadHeight / 12,
  );

  final biggerEyeRect = Rect.fromCircle(
    center: biggerEyeOffset,
    radius: biggerEyeRadius,
  );

  final smallerEyeRect = Rect.fromCircle(
    center: smallerEyeOffset,
    radius: smallerEyeRadius,
  );

  canvas
    ..drawOval(biggerEyeRect, biggerEyePaint)
    ..drawOval(smallerEyeRect, smallerEyePaint);
}
