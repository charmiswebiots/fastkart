import 'package:flutter/material.dart';
import 'package:fastkart/utilities/color_utils.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color txt;
  Color primary;
  Color secondary;
  Color accentTxt;
  Color whiteColor;
  Color surface;
  Color error;

  //Extra Colors
  Color bgGray;
  Color gray;
  Color darkGray;
  Color lightGray;
  Color borderGray;
  Color green;
  Color white;
  Color lightPrimary;
  Color greyBGColor;
  Color titleColor;
  Color contentColor;
  Color darkContentColor;
  Color ratingColor;
  Color borderColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.txt,
    required this.primary,
    required this.secondary,
    required this.accentTxt,
    required this.whiteColor,
    required this.surface,
    required this.error,
    //Extra
    required this.bgGray,
    required this.gray,
    required this.darkGray,
    required this.lightGray,
    required this.borderGray,
    required this.green,
    required this.white,
    required this.lightPrimary,
    required this.greyBGColor,
    required this.titleColor,
    required this.contentColor,
    required this.darkContentColor,
    required this.ratingColor,
    required this.borderColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          txt: const Color(0xFF001928),
          primary: const Color(0xFF0BAF9A),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          whiteColor: const Color(0xFFFFFFFF),
          surface: Colors.white,
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFFF0F8FD),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFF666666),
          lightGray: const Color(0xFFFAFAFA),
          borderGray: const Color(0xFFE6E8EA),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          lightPrimary: const Color(0xFFEDF8F8),
          greyBGColor: const Color(0xFFF1F1F1),
          titleColor: const Color(0xFF222222),
          contentColor: const Color(0xFFCACACA),
          darkContentColor: const Color(0xFF777777),
          ratingColor: const Color(0xFFFFBF13),
          borderColor: const Color(0xFFF1F1F1),
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          primary: const Color(0xFF6EBAE7),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          whiteColor: const Color(0xFFFFFFFF),
          surface: const Color(0xFF151A1E),
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFF262F36),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFF999999),
          lightGray: const Color(0xFFFAFAFA),
          borderGray: const Color(0xFF353C41),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          lightPrimary: const Color(0xFFEDF8F8),
          greyBGColor: const Color(0xFFF1F1F1),
          titleColor: const Color(0xFF222222),
          contentColor: const Color(0xFFCACACA),
          darkContentColor: const Color(0xFF777777),
          ratingColor: const Color(0xFFFFBF13),
          borderColor: const Color(0xFFF1F1F1),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryVariant: shiftHsl(primary, -.2),
        secondary: secondary,
        secondaryVariant: shiftHsl(secondary, -.2),
        background: whiteColor,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: borderGray,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      buttonColor: primary,
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }

//Color shift(Color c, double d) => shiftHsl(c, d * (isDark ? -1 : 1));
}
