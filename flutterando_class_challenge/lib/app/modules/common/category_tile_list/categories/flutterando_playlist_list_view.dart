import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/video.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_category_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/category_tile_list_view.dart';

import '../../../../core/constants/colors.dart';

class FlutterandoPlaylistListView extends StatelessWidget {
  const FlutterandoPlaylistListView({required this.playlistList});

  final List<Video> playlistList;

  @override
  Widget build(BuildContext context) {
    return CategoryTileListView(
      itemListLength: playlistList.length,
      itemBuilder: (context, index) => _FlutterandoPlaylist(
        playlist: playlistList[index],
      ),
      title: FlutterandoCategoryListViewTitle(
        categoryIconPathUrl: 'assets/img/icons/play.png',
        categoryLabel: 'playlist',
      ),
      maxHeight: 200,
    );
  }
}

class _FlutterandoPlaylist extends StatelessWidget {
  const _FlutterandoPlaylist({
    required this.playlist,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Video playlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: AppColors.cardBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                      color: AppColors.subtitle,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/img/icons/play.png',
                    color: Colors.blue[900],
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        playlist.title!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.title,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      playlist.author!,
                      overflow: TextOverflow.ellipsis,
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
        ),
      ),
      onTap: onTap,
    );
  }
}
