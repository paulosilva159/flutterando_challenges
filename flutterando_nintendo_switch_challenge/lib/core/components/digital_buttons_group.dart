import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

import 'buttons/small_roudend_button.dart';

class DigitalButtonsGroup extends StatelessWidget {
  const DigitalButtonsGroup({
    @required this.type,
    @required this.height,
  })  : assert(type != null),
        assert(height != null);

  final ButtonsGroupType type;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SmallRoundedButton(
              height: height / 3,
              type: type,
              icon: type == ButtonsGroupType.directional
                  ? Icon(
                      Icons.arrow_drop_up,
                      color: AppColors.digitalDirectionTopLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: AppColors.actionButtonTopLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SmallRoundedButton(
              height: height / 3,
              type: type,
              icon: type == ButtonsGroupType.directional
                  ? Icon(
                      Icons.arrow_left,
                      color: AppColors.digitalDirectionLeftLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'Y',
                        style: TextStyle(
                          color: AppColors.actionButtonLeftLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SmallRoundedButton(
              height: height / 3,
              type: type,
              icon: type == ButtonsGroupType.directional
                  ? Icon(
                      Icons.arrow_right,
                      color: AppColors.digitalDirectionRightLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: AppColors.actionButtonRightLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmallRoundedButton(
              height: height / 3,
              type: type,
              icon: type == ButtonsGroupType.directional
                  ? Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.digitalDirectionBottomLayer2Bottom,
                    )
                  : Center(
                      child: Text(
                        'B',
                        style: TextStyle(
                          color: AppColors.actionButtonBottomLayer2Bottom,
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ButtonsGroupType {
  directional,
  action,
}
