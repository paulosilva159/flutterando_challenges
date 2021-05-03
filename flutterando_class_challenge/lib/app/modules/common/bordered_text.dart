import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  const BorderedText({
    required this.text,
    this.fontSize,
    this.borderWidth,
    this.textColor,
    this.borderColor,
  });

  final String text;
  final double? fontSize;
  final double? borderWidth;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 25,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = borderWidth ?? 0.5
              ..color = borderColor ?? Colors.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 25,
            color: textColor ?? Colors.transparent,
          ),
        ),
      ],
    );
  }
}
