import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/banner/custom_banner.dart';

import 'screens/nintendo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set defaults to system colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //statusBar
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      //navigationBar color
      systemNavigationBarColor: AppColors.bgScreenBottom,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    //Orientations configs of app
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'NintendoSwt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NintendoScreen(),
      builder: (context, screen) => asuka.builder(
        context,
        CustomBanner(
          screen: screen,
        ),
      ),
    );
  }
}
