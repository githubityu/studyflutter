import 'package:flutter/material.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D

class AppColors {
  AppColors({
    required this.btnTextColor,
    required this.btnBgColor,
    required this.background,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.signIn,
    required this.signOut,
  });

  factory AppColors.light() {
    return  AppColors(
      btnTextColor: Colors.white,
      btnBgColor: const Color(0xff4285f4),
      background: const Color(0xffEDEEF0),
      accent: const Color(0xff4285f4),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }

  factory AppColors.dark() {
    return AppColors(
      btnTextColor: Colors.white,
      btnBgColor: Color(0xff4285f4),
      background: Color(0xff121212),
      accent: Color(0xff4285f4),
      disabled: Colors.white12,
      error: Color(0xffff5544),
      divider: Colors.white54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }


  Color background;
  Color accent;
  Color disabled;
  Color error;
  Color divider;

  Color signIn;
  Color signOut;

  Color btnTextColor;
  Color btnBgColor;
}
