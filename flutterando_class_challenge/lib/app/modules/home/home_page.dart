import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando_class/app/data/model/book.dart';
import 'package:flutterando_class/app/data/model/knowledge_trail.dart';
import 'package:flutterando_class/app/data/model/video.dart';
import 'package:flutterando_class/app/modules/common/appbar_button.dart';
import 'package:flutterando_class/app/modules/common/bordered_text.dart';
import 'package:flutterando_class/app/modules/common/carousel_row_indicator.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_book_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_playlist_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/flutterando_video_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/has_to_finish_video_list_view.dart';
import 'package:flutterando_class/app/modules/common/category_tile_list/categories/knowledge_trail_list_view.dart';
import 'package:flutterando_class/app/modules/personal_progress/personal_progress_page.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final videoList = <Video>[
    Video(
      imagePathUrl: 'assets/img/stateManager.png',
      title: 'Gerência de Estado',
      author: 'Flutterando',
    ),
    Video(
      imagePathUrl: 'assets/img/fabioAkita.png',
      title: 'Fabio Akita',
      author: 'Akitando',
    ),
  ];

  final videoList2 = <Video>[
    Video(
      imagePathUrl: 'assets/img/hasura.png',
    ),
    Video(
      imagePathUrl: 'assets/img/engage.png',
    ),
    Video(
      imagePathUrl: 'assets/img/latam.png',
    ),
  ];

  final videoList3 = <Video>[
    Video(
      imagePathUrl: 'assets/img/stateManager.png',
      title: 'RouterOutlet',
      author: 'Jacob Moura',
    ),
    Video(
      imagePathUrl: 'assets/img/fabioAkita.png',
      title: 'Arquitetura para micro-apps',
      author: 'Jacob Moura',
    ),
  ];

  final bookList = <Book>[
    Book(
      coverPathUrl: 'assets/img/books/dart.png',
      title: 'Dart - October 1, 2020',
      author: 'Reder Glauber Gad Weyers - 2020',
    ),
    Book(
      coverPathUrl: 'assets/img/books/flutter_na_pratica.png',
      title: 'Flutter na Prática',
      author: 'Frank Zammetti - 2020',
    ),
    Book(
      coverPathUrl: 'assets/img/books/codigo_limpo.png',
      title: 'Código Limpo - Habilidades Práticas do Agile Software',
      author: 'Robert C. Martin - 2020',
    ),
  ];

  final knowledgeTrailList = <KnowledgeTrail>[
    KnowledgeTrail(
      title: 'Iniciante',
      description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ),
    KnowledgeTrail(
      title: 'Semana Modular',
      description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: controller,
        onState: (_, counter) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                stretch: true,
                expandedHeight: 280,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: _AppBarFlexibleSpace(),
                  collapseMode: CollapseMode.pin,
                ),
              ),
              SliverToBoxAdapter(
                child: CarouselRowIndicator(
                  itemCount: 2,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HasToFinishVideoListView(
                      videoList: videoList,
                    ),
                    FlutterandoVideoListView(
                      videoList: videoList2,
                    ),
                    FlutterandoPlaylistListView(
                      playlistList: videoList3,
                    ),
                    FlutterandoBookListView(
                      bookList: bookList,
                    ),
                    KnowledgeTrailListView(
                      knowledgeTrailList: knowledgeTrailList,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
            ],
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class _AppBarFlexibleSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'assets/img/ftJacob.png',
              fit: BoxFit.cover,
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, .75, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black26,
                  Colors.black,
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Jacob Moura',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Um novo modelo de',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              BorderedText(
                text: 'Comunidade',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBarButton(
                    icon: Icons.play_arrow_sharp,
                    label: 'assistir',
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  AppBarButton(
                    icon: Icons.add,
                    label: 'detalhes',
                    isReverseColor: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalProgressPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/img/logo/logo.png',
                  height: 64,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
