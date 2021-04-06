import 'package:flutter/material.dart';
import 'package:kong/pages/characters_view.dart';
import 'package:kong/pages/lattice_view.dart';
import 'package:kong/pages/stairs_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: statusBar,
            ),
            KongGame(
              statusBarHeight: statusBar,
            ),
          ],
        ),
      ),
    );
  }
}

class KongGame extends StatelessWidget {
  const KongGame({@required this.statusBarHeight});

  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final latticeSizeProportion = 11;
    final latticeSize = Size(
      screenSize.width / latticeSizeProportion,
      screenSize.width / latticeSizeProportion,
    );

    final stairStepSizeProportion = 11;
    final stairStepSize = Size(
      screenSize.width / stairStepSizeProportion,
      (screenSize.width / stairStepSizeProportion) * .5,
    );

    return Stack(
      children: [
        LatticeView(
          latticeSize: latticeSize,
          stairStepHeight: stairStepSize.height,
        ),
        StairsView(
          stairStepSize: stairStepSize,
        ),
        CharactersView(
          latticeWidth: latticeSize.width,
          stairStepHeight: stairStepSize.height,
          statusBarHeight: statusBarHeight,
        ),
      ],
    );
  }
}
