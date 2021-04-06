import 'package:flutter/material.dart';

import '../constants/colors.dart';

class KongTheme {
  TextTheme call() {
    return TextTheme(
      //HeadLine 1
      headline1: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.mainText,
      ),
      //HeadLine 2
      headline2: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      //HeadLine 3
      headline3: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 16,
        color: AppColors.mainText,
        fontWeight: FontWeight.w400,
      ),
      //HeadLine 4
      headline4: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      //HeadLine 5
      headline5: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      //HeadLine 6
      headline6: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 10,
      ),
      //AppBarName

      // //body 2
      // bodyText2: GoogleFonts.raleway(
      //   color: Color(0xFF969696),
      //   letterSpacing: -0.04,
      //   fontSize: 12,
      //   fontWeight: FontWeight.bold,
      // ),
      // subtitle1: ,
      // //Footnote 1
      // subtitle2: GoogleFonts.raleway(
      //   color: Colors.white,
      //   letterSpacing: 0,
      //   fontSize: 16,
      //   fontWeight: FontWeight.normal,
      // ),
      //Titulo
      // caption: ,
      //buttonLabel
      // button: ,
    );
  }
}
