import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/inner_cover/short_info_display.dart';

class BottomDisplays extends StatelessWidget {
  const BottomDisplays({
    @required this.leftDisplayChild,
    @required this.rightDisplayChild,
  })  : assert(leftDisplayChild != null),
        assert(rightDisplayChild != null);

  final Widget leftDisplayChild;
  final Widget rightDisplayChild;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BottomDisplay(
          child: leftDisplayChild,
        ),
        _BottomDisplay(
          child: rightDisplayChild,
        ),
      ],
    );
  }
}

class _BottomDisplay extends StatelessWidget {
  const _BottomDisplay({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.width / 9,
      width: _size.width / 3,
      child: ShortInfoDisplay(
        backgroundColor: Colors.blueGrey[900],
        child: child,
      ),
    );
  }
}
