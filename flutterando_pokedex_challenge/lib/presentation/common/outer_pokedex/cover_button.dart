import 'package:flutter/material.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/painters/cover_button_painter.dart';
import 'package:flutterando_pokedex_challenge/presentation/common/utils/colors.dart';

class CoverButton extends StatefulWidget {
  const CoverButton({@required this.height, this.onLongPress})
      : assert(height != null);

  final double height;
  final VoidCallback onLongPress;

  @override
  _CoverButtonState createState() => _CoverButtonState();
}

class _CoverButtonState extends State<CoverButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<double>(begin: 0, end: 2.5).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onLongPress: widget.onLongPress,
        onTapDown: (details) {
          _controller.forward();
        },
        onTapUp: (details) {
          _controller.reverse();
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Container(
            height: widget.height,
            width: widget.height / 2,
            child: CustomPaint(
              painter: CoverButtonPainter(
                color: PokedexColors.outerCoverButtonColor,
                depthColor: PokedexColors.outerShadowPokedexColor,
                depth: _animation.value,
              ),
            ),
          ),
        ),
      );
}
