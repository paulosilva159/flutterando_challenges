import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/components/clippers/logo_clipper.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({@required this.width, @required this.color})
      : assert(width != null),
        assert(color != null);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: width * 2,
          child: ClipPath(
            clipper: LogoLeftPadClipper(
              customSize: Size(width, width * 2),
            ),
            child: Container(
              color: color,
            ),
          ),
        ),
        SizedBox(
          width: width / 4,
        ),
        Container(
          width: width,
          height: width * 2,
          child: ClipPath(
            clipper: LogoRightPadClipper(
              customSize: Size(width, width * 2),
            ),
            child: Container(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
