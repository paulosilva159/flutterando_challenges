import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class RedirectionLabeledButton extends StatelessWidget {
  const RedirectionLabeledButton({required this.label, this.onTap});

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.title,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Image.asset(
            'assets/img/icons/right.png',
            height: 8,
          )
        ],
      ),
    );
  }
}
