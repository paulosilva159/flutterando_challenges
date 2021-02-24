import 'package:flutter/material.dart';

class ShortInfoDisplay extends StatelessWidget {
  const ShortInfoDisplay({
    @required this.child,
    this.backgroundColor = Colors.blueGrey,
  }) : assert(child != null);

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: child,
      );
}
