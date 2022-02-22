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

  final nunitoTextStyle = (
          {color,
          double fontSize = 16,
          FontWeight fontWeight = FontWeight.normal}) =>
  TextStyle(
      color: color, fontSize: 16, fontWeight: fontWeight,
    fontFamily: GoogleFonts.nunitoSans().fontFamily
  );

  final mulishTextStyle = (
          {color,
          double fontSize = 16,
          FontWeight fontWeight = FontWeight.normal,
          TextDecoration textDecoration = TextDecoration.none}) =>
      GoogleFonts.mulish(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration);

  final quicksandTextStyle = (
          {color,
          double fontSize = 16,
          FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.quicksand(
        color: color,
        fontSize: fontSize,
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
