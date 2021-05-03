import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.icon,
    required this.label,
    this.isReverseColor = false,
  });

  final IconData icon;
  final String label;
  final bool isReverseColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isReverseColor ? Colors.transparent : Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          crossAxisAlignment: isReverseColor
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: 13,
              color: isReverseColor ? Colors.white : Colors.black,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: TextStyle(
                  color: isReverseColor ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
