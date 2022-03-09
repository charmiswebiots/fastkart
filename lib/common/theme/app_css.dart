import 'package:fastkart/common/app_screen_util.dart';
import 'package:flutter/material.dart';
import 'package:fastkart/extensions/textstyle_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

part 'scale.dart';

class AppCss {
  static const TextStyle poppins = TextStyle(
    fontFamily: Fonts.Poppins,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
  );

  //nunino font text style
  // ignore: prefer_function_declarations_over_variables
  final nunitoTextStyle =
      ({color, double fontSize = 16, FontWeight? fontWeight}) => TextStyle(
          color: color,
          fontSize: AppScreenUtil().fontSize(fontSize),
          fontWeight: fontWeight,
          fontFamily: GoogleFonts.nunitoSans().fontFamily);

  //mulish font text style
  // ignore: prefer_function_declarations_over_variables
  final mulishTextStyle = (
          {color,
          double fontSize = 16,
          FontWeight? fontWeight,
          TextDecoration? textDecoration}) =>
      GoogleFonts.mulish(
          color: color,
          fontSize: AppScreenUtil().fontSize(fontSize),
          fontWeight: fontWeight,
          decoration: textDecoration, );

  //quicksand font text style
  // ignore: prefer_function_declarations_over_variables
  final quicksandTextStyle = (
          {color, double fontSize = 16, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(
        color: color,
        fontSize: AppScreenUtil().fontSize(fontSize),
        fontWeight: fontWeight,
      );

  //Text Style
  static TextStyle get h1 => poppins.bold.size(FontSizes.f18).letterSpace(.7);

  static TextStyle get h2 =>
      poppins.semiBold.size(FontSizes.f16).letterSpace(.7);

  static TextStyle get h3 => poppins.semiBold.size(FontSizes.f14);

  static TextStyle get body1 => poppins.size(FontSizes.f14);

  static TextStyle get body2 => poppins.size(FontSizes.f12);

  static TextStyle get body3 => poppins.size(FontSizes.f11);

  static TextStyle get caption => poppins.size(FontSizes.f11).letterSpace(.3);

  static TextStyle get footnote => poppins.bold.size(FontSizes.f11);
}
