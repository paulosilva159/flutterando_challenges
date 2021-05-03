import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/video.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_category_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/category_tile_list_view.dart';

class FlutterandoVideoListView extends StatelessWidget {
  const FlutterandoVideoListView({required this.videoList});

  final List<Video> videoList;

  @override
  Widget build(BuildContext context) {
    return CategoryTileListView(
      itemListLength: videoList.length,
      itemBuilder: (context, index) => _FlutterandoVideo(
        imagePathUrl: videoList[index].imagePathUrl,
      ),
      title: FlutterandoCategoryListViewTitle(
        categoryIconPathUrl: 'assets/img/icons/play.png',
        categoryLabel: 'videos',
      ),
      maxHeight: 120,
    );
  }
}

class _FlutterandoVideo extends StatelessWidget {
  const _FlutterandoVideo({
    required this.imagePathUrl,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String imagePathUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(imagePathUrl),
      onTap: onTap,
    );
  }
}
