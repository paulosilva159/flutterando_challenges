import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/colors.dart';
import 'core/themes/theme_app.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        //statusBar
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        //navigationBar color
        systemNavigationBarColor: AppColors.primary, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
      ),
    );
    //Orientations configs of app
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeApp().theme(),
      home: HomePage(),
    );
  }
}
