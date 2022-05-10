import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/setting/util/setting_constants.dart';
import 'package:fastkart/views/pages/setting/util/setting_constants.dart';
import 'package:fastkart/views/pages/setting/util/setting_constants.dart';
import 'package:flutter/material.dart';

class SettingFontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = SettingFontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: AppCss().nunitoTextStyle(
            color: color, fontWeight: fontWeight, fontSize:  AppScreenUtil().fontSize(fontSize)));
  }

//mulish font family text layout
  Widget mulishtextLayout({
    String? text,
    color,
    double fontSize = SettingFontSize.textSizeMedium,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration textDecoration = TextDecoration.none,
    GestureTapCallback? onTap,
    double letterSpacing = 0,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          overflow: overflow,
          textAlign: textAlign,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }

  //quicksand font family text layout
  Widget quicksandtextLayout(
      {String? text,
        color,
        double fontSize = SettingFontSize.textSizeMedium,
        FontWeight fontWeight = FontWeight.normal,TextAlign textAlign = TextAlign.left}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: AppCss().quicksandTextStyle(
          color: color,
          fontSize:  AppScreenUtil().fontSize(fontSize),
          fontWeight:fontWeight,
      ),
    );
  }
}
