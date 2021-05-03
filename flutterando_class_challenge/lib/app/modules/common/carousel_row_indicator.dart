import 'package:flutter/material.dart';

class CarouselRowIndicator extends StatelessWidget {
  const CarouselRowIndicator({required this.itemCount, this.selectedIndex = 0});

  final int selectedIndex;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _CarouselIndicator(
            isSelected: index == selectedIndex,
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 5,
          ),
          itemCount: itemCount,
        ),
      ),
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  const _CarouselIndicator({this.isSelected = false});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: isSelected ? 10 : 5,
      decoration: BoxDecoration(
        color: Colors.cyan,
        shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSelected ? BorderRadius.circular(5) : null,
      ),
    );
  }
}
