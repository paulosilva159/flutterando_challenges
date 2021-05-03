import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/video.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/category_tile_list_view.dart';

import '../../../../core/constants/colors.dart';

class HasToFinishVideoListView extends StatelessWidget {
  const HasToFinishVideoListView({required this.videoList});

  final List<Video> videoList;

  @override
  Widget build(BuildContext context) {
    return CategoryTileListView(
      itemBuilder: (context, index) => _HasToFinishVideoTile(
        video: videoList[index],
      ),
      itemListLength: videoList.length,
      title: Text(
        'Continue de onde você parou',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.subtitle,
        ),
      ),
    );
  }
}

class _HasToFinishVideoTile extends StatelessWidget {
  const _HasToFinishVideoTile({required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                video.imagePathUrl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  video.title!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.title,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  video.author!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
