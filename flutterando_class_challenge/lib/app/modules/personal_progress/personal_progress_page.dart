import 'package:flutter/material.dart';
import 'package:flutterando_class/app/data/model/video.dart';

import '../../core/constants/colors.dart';

class PersonalProgressPage extends StatefulWidget {
  @override
  _PersonalProgressPageState createState() => _PersonalProgressPageState();
}

class _PersonalProgressPageState extends State<PersonalProgressPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorPadding: EdgeInsets.only(top: -10),
            labelColor: AppColors.secondary,
            indicator: BoxDecoration(
              color: AppColors.subtitle,
              borderRadius: BorderRadius.circular(6),
            ),
            indicatorWeight: 12,
            tabs: [
              Text(
                'Flutterando Videos',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Flutterando Playlist',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          leading: GestureDetector(
            child: Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.cardBackground),
              child: Icon(Icons.chevron_left),
            ),
            onTap: () => Navigator.pop(context),
          ),
          actions: [Icon(Icons.swap_vert_rounded)],
          centerTitle: true,
          title: Text(
            'Meu progresso',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  _PersonalProgressCategoryTile(
                    title: 'Em andamento',
                    videoList: [
                      Video(
                        title: 'Gerência de Estado',
                        type: 'Aula 01',
                        imagePathUrl: 'assets/img/stateManager.png',
                        progress: 60,
                      ),
                    ],
                  ),
                  _PersonalProgressCategoryTile(
                    title: 'Concluídos',
                    videoList: [
                      Video(
                        title: 'Fabio Akita',
                        type: 'Live',
                        imagePathUrl: 'assets/img/fabioAkita.png',
                        progress: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Tab(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalProgressCategoryTile extends StatelessWidget {
  const _PersonalProgressCategoryTile({
    required this.videoList,
    this.title = '',
  });

  final String title;
  final List<Video> videoList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '$title${videoList.length > 0 ? ' (${videoList.length})' : ''}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.subtitle,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => _PersonalProgressTile(
              video: videoList[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 8,
            ),
            itemCount: videoList.length,
          ),
        ],
      ),
    );
  }
}

class _PersonalProgressTile extends StatelessWidget {
  const _PersonalProgressTile({required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              video.imagePathUrl,
              height: 120,
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cardBackground,
              ),
              child: Icon(
                video.progress == 100
                    ? Icons.refresh_rounded
                    : Icons.play_arrow_sharp,
                color: AppColors.accent,
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    video.title!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    video.type!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subtitle,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${video.progress.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subtitle,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    value: video.progress / 100,
                    backgroundColor: AppColors.bgProgressbar,
                    valueColor: AlwaysStoppedAnimation(
                      video.progress == 100.0
                          ? AppColors.accent
                          : AppColors.secondary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: AppColors.secondary,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
