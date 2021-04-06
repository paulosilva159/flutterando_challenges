import 'package:flutter/material.dart';
import 'package:kong/core/components/characters/kong.dart';
import 'package:kong/core/components/characters/mario.dart';
import 'package:kong/core/components/characters/peach.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({
    @required this.latticeWidth,
    @required this.stairStepHeight,
    @required this.statusBarHeight,
  });

  final double latticeWidth;
  final double stairStepHeight;
  final double statusBarHeight;

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  ValueNotifier onGameEndNotifier;

  @override
  void initState() {
    onGameEndNotifier = ValueNotifier<bool>(false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peachFloorWidth = widget.latticeWidth * 3;

    return Container(
      height: MediaQuery.of(context).size.height - widget.statusBarHeight,
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: onGameEndNotifier,
            builder: (_, isGameOver, __) => TextButton(
              onPressed: isGameOver
                  ? () {
                      setState(() {});
                    }
                  : null,
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  isGameOver ? 'Game Over' : '',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
          Positioned(
            left: widget.latticeWidth * 4,
            top: widget.stairStepHeight * 3 + 4,
            child: Container(
              width: peachFloorWidth,
              child: Peach(
                peachSize: Size(
                  widget.latticeWidth,
                  widget.latticeWidth * 2,
                ),
                onGameEndNotifier: onGameEndNotifier,
              ),
            ),
          ),
          Positioned(
            top: widget.stairStepHeight * 10 + 2,
            child: Kong(
              kongSize: Size(
                widget.latticeWidth * 2,
                widget.latticeWidth * 2,
              ),
              onGameEndNotifier: onGameEndNotifier,
            ),
          ),
          Positioned(
            top: widget.stairStepHeight * 7 + 2 - widget.latticeWidth,
            height: widget.stairStepHeight * 27 + widget.latticeWidth,
            child: Mario(
              stairStepHeight: widget.stairStepHeight,
              latticeWidth: widget.latticeWidth,
              marioSize: Size(
                widget.latticeWidth,
                widget.latticeWidth,
              ),
              onGameEndNotifier: onGameEndNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
