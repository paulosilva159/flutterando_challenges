import 'package:flutter/material.dart';

class CategoryTileListView extends StatelessWidget {
  const CategoryTileListView({
    required this.itemListLength,
    required this.itemBuilder,
    required this.title,
    this.maxHeight = 80,
    this.maxWidth = double.infinity,
  });

  final int itemListLength;
  final Widget Function(BuildContext, int) itemBuilder;
  final double maxHeight;
  final double maxWidth;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(
            height: 24,
          ),
          LimitedBox(
            maxHeight: maxHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: itemBuilder,
              itemCount: itemListLength,
              separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
