import 'package:flutter/material.dart';

class Kong extends StatelessWidget {
  const Kong({
    @required this.kongSize,
    @required this.onGameEndNotifier,
  });

  final Size kongSize;
  final ValueNotifier<bool> onGameEndNotifier;

  final idleKongPath = 'assets/sprites/extra/kong1.png';
  final rageKongPath = 'assets/sprites/extra/kong.png';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: onGameEndNotifier,
      builder: (_, isGameOver, __) => AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Image.asset(
          isGameOver ? rageKongPath : idleKongPath,
          height: kongSize.height,
          width: kongSize.width,
        ),
      ),
    );
  }
}
