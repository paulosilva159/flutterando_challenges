import 'package:flutter/material.dart';

class Peach extends StatefulWidget {
  const Peach({
    @required this.peachSize,
    @required this.onGameEndNotifier,
  });

  final Size peachSize;
  final ValueNotifier<bool> onGameEndNotifier;

  @override
  _PeachState createState() => _PeachState();
}

class _PeachState extends State<Peach> {
  final peachOnLeftPath = 'assets/sprites/extra/princessLeft.png';
  final peachOnRightPath = 'assets/sprites/extra/princessRight.png';

  String peachImagePath;
  bool isWalkingToRight = false;

  @override
  void initState() {
    peachImagePath = peachOnRightPath;

    Future.delayed(
      Duration.zero,
    ).then((_) {
      setState(() {
        isWalkingToRight = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.onGameEndNotifier,
      builder: (_, isGameOver, __) => AnimatedContainer(
        curve: Curves.easeInOut,
        alignment:
            isWalkingToRight ? Alignment.centerLeft : Alignment.centerRight,
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          isWalkingToRight ? peachOnLeftPath : peachOnRightPath,
          height: widget.peachSize.height,
          width: widget.peachSize.width,
          alignment: Alignment.centerLeft,
        ),
        onEnd: () {
          if (!isGameOver) {
            setState(() {
              isWalkingToRight = !isWalkingToRight;
            });
          }
        },
      ),
    );
  }
}
