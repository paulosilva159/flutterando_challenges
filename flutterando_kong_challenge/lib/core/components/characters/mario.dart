import 'package:flutter/material.dart';

class Mario extends StatefulWidget {
  const Mario({
    @required this.marioSize,
    @required this.latticeWidth,
    @required this.stairStepHeight,
    @required this.onGameEndNotifier,
  });

  final double latticeWidth;
  final double stairStepHeight;
  final Size marioSize;
  final ValueNotifier onGameEndNotifier;

  @override
  _MarioState createState() => _MarioState();
}

class _MarioState extends State<Mario> {
  String marioImagePath = 'assets/sprites/walk/marioRight.png';

  bool hasEnded = false;

  var actualMovement = GoalAchievementStep.first;
  var lastHorizontalStep = HorizontalStep.first;
  var lastVerticalStep = VerticalStep.first;

  Duration movementDuration;

  Tween<double> marioMovementTween;

  double firstMovement;
  double secondMovement;
  double thirdMovement;
  double fourthMovement;
  double fifthMovement;
  double sixthMovement;

  void defineMovement(double position) async {
    bool isStairEnd = false;

    if ((position - (firstMovement + secondMovement)).abs() < 1 ||
        (position -
                    (firstMovement +
                        secondMovement +
                        thirdMovement +
                        fourthMovement))
                .abs() <
            1 ||
        (position -
                    (firstMovement +
                        secondMovement +
                        thirdMovement +
                        fourthMovement +
                        fifthMovement +
                        sixthMovement))
                .abs() <
            1) {
      isStairEnd = true;
    } else {
      if (position == 0) {
        actualMovement = GoalAchievementStep.first;
        movementDuration = Duration.zero;
      } else {
        if (position <= firstMovement) {
          actualMovement = GoalAchievementStep.second;
          movementDuration = Duration(milliseconds: 2970);
        } else if (position <= firstMovement + secondMovement) {
          actualMovement = GoalAchievementStep.third;
          movementDuration = Duration(milliseconds: 2480);
        } else if (position <= firstMovement + secondMovement + thirdMovement) {
          actualMovement = GoalAchievementStep.fourth;
          movementDuration = Duration(milliseconds: 1020);
        } else if (position <=
            firstMovement + secondMovement + thirdMovement + fourthMovement) {
          actualMovement = GoalAchievementStep.fifth;
          movementDuration = Duration(milliseconds: 2480);
        } else if (position <=
            firstMovement +
                secondMovement +
                thirdMovement +
                fourthMovement +
                fifthMovement) {
          actualMovement = GoalAchievementStep.sixth;
          movementDuration = Duration(milliseconds: 1020);
        } else if (position <=
            firstMovement +
                secondMovement +
                thirdMovement +
                fourthMovement +
                fifthMovement +
                sixthMovement) {
          actualMovement = GoalAchievementStep.seventh;
          movementDuration = Duration(milliseconds: 1900);
        }
      }
    }

    if (!hasEnded) {
      if (!isStairEnd) {
        marioImagePath = defineImagePath(actualMovement);
      } else {
        marioImagePath = 'assets/sprites/stairs/marioStairsTop.png';
      }
    } else {
      marioImagePath = 'assets/sprites/walk/marioLeft.png';
    }
  }

  EdgeInsets definePosition(GoalAchievementStep movement) {
    switch (movement) {
      case GoalAchievementStep.first:
        return EdgeInsets.only();
      case GoalAchievementStep.second:
        return EdgeInsets.only(left: firstMovement);
      case GoalAchievementStep.third:
        return EdgeInsets.only(left: firstMovement, bottom: secondMovement);
      case GoalAchievementStep.fourth:
        return EdgeInsets.only(
            left: firstMovement + thirdMovement, bottom: secondMovement);
      case GoalAchievementStep.fifth:
        return EdgeInsets.only(
            left: firstMovement + thirdMovement,
            bottom: secondMovement + fourthMovement);
      case GoalAchievementStep.sixth:
        return EdgeInsets.only(
            left: firstMovement, bottom: secondMovement + fourthMovement);
      case GoalAchievementStep.seventh:
        return EdgeInsets.only(
            left: firstMovement,
            bottom: secondMovement + fourthMovement + sixthMovement);
      default:
        return EdgeInsets.only();
    }
  }

  String defineImagePath(GoalAchievementStep movement) {
    String analyzeHorizontalStep(bool isMovingRight) {
      final direction = '${isMovingRight ? 'Right' : 'Left'}';

      switch (lastHorizontalStep) {
        case HorizontalStep.first:
          lastHorizontalStep = HorizontalStep.second;
          return 'assets/sprites/walk/mario$direction.png';
        case HorizontalStep.second:
          lastHorizontalStep = HorizontalStep.third;
          return 'assets/sprites/walk/mario${direction}1.png';
        case HorizontalStep.third:
          lastHorizontalStep = HorizontalStep.first;
          return 'assets/sprites/walk/mario${direction}2.png';
        default:
          return 'assets/sprites/walk/mario$direction.png';
      }
    }

    String analyzeVerticalStep() {
      switch (lastVerticalStep) {
        case VerticalStep.first:
          lastVerticalStep = VerticalStep.second;
          return 'assets/sprites/stairs/marioStairs.png';
        case VerticalStep.second:
          lastVerticalStep = VerticalStep.third;
          return 'assets/sprites/stairs/marioStairsLeft.png';
        case VerticalStep.third:
          lastVerticalStep = VerticalStep.first;
          return 'assets/sprites/stairs/marioStairsRight.png';
        default:
          return 'assets/sprites/stairs/marioStairsTop.png';
      }
    }

    switch (movement) {
      case GoalAchievementStep.first:
        return 'assets/sprites/walk/marioRight.png';
      case GoalAchievementStep.second:
        return analyzeHorizontalStep(true);
      case GoalAchievementStep.third:
        return analyzeVerticalStep();
      case GoalAchievementStep.fourth:
        return analyzeHorizontalStep(true);
      case GoalAchievementStep.fifth:
        return analyzeVerticalStep();
      case GoalAchievementStep.sixth:
        return analyzeHorizontalStep(false);
      case GoalAchievementStep.seventh:
        return analyzeVerticalStep();
      default:
        return 'assets/sprites/walk/marioRight.png';
    }
  }

  @override
  void initState() {
    firstMovement = 6 * widget.latticeWidth;
    secondMovement = 10 * widget.stairStepHeight;
    thirdMovement = 2 * widget.latticeWidth;
    fourthMovement = 10 * widget.stairStepHeight;
    fifthMovement = 2 * widget.latticeWidth;
    sixthMovement = 7 * widget.stairStepHeight;

    marioMovementTween = Tween(
      begin: 0,
      end: firstMovement +
          secondMovement +
          thirdMovement +
          fourthMovement +
          fifthMovement +
          sixthMovement,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: marioMovementTween,
      duration: Duration(seconds: 12),
      builder: (_, position, __) {
        defineMovement(position);

        return AnimatedContainer(
          alignment: Alignment.bottomLeft,
          margin: definePosition(actualMovement),
          duration: movementDuration,
          child: Image.asset(
            marioImagePath,
            height: widget.marioSize.height,
            width: widget.marioSize.width,
          ),
        );
      },
      onEnd: () {
        setState(() {
          hasEnded = true;
        });

        widget.onGameEndNotifier..value = true;
      },
    );
  }
}

enum GoalAchievementStep {
  first,
  second,
  third,
  fourth,
  fifth,
  sixth,
  seventh,
}

enum HorizontalStep {
  first,
  second,
  third,
}

enum VerticalStep {
  first,
  second,
  third,
}
