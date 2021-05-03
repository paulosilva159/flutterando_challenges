import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class IconedText extends StatelessWidget {
  const IconedText({
    required this.iconPathUrl,
    required this.label,
  });

  final String iconPathUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          iconPathUrl,
          height: 24,
        ),
        Positioned(
          left: 12,
          top: 2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Flutterando ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.title,
                  ),
                ),
                TextSpan(
                  text: label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
