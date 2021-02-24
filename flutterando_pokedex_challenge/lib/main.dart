import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterando_pokedex_challenge/presentation/pokedex/pokedex_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(
    PokedexApp(),
  );
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokedexView(),
      );
}
