import 'package:flutter/material.dart';

class AppColors {
  //Neutral Color
  static const white = Color(0xFFFFFFFF);
  static const backgroundColor = Color(0xFFF5F5F5);
  static const borders = Color(0xFFADADAD);
  static const lightFonts = Color(0xFF858585);
  static const bodyFonts = Color(0xFF333333);
  static const darkFonts = Color(0xFF1F1F1F);

  //Semantic Color
  static const yellow = Color(0xFFFFBA49);
  static const yellow10 = Color(0xFFFFF8E7);
  static const yellow50 = Color(0xFFFFE29D);

  static const green = Color(0xFF00C48C);
  static const green10 = Color(0xFFD5F2EA);
  static const green50 = Color(0xFF7DDFC3);

  static const blue = Color(0xFF0084F4);
  static const blue10 = Color(0xFFD5E9FA);
  static const blue50 = Color(0xFF66B5F8);

  static const orange = Color(0xFFFE8239);
  static const orange10 = Color(0xFFFFE8DA);
  static const orange50 = Color(0xFFFFC09C);

  //Primary Color
  static const primary10 = Color(0xffFBE8EA);
  static const primary30 = Color(0xffF7D2D5);
  static const primary70 = Color(0xffE14B58);
  static const primaryColor = Color(0xffD91E2E);
  static const primaryDark = Color(0xffC31B29);

  //accent color
  static const accent = LinearGradient(
    colors: [
      Color(0xffF9A51A),
      Color(0xffFBB612),
      Color(0xffFFDD00),
    ],
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.869, -0.496),
  );
}
