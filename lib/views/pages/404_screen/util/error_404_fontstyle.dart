import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/404_screen/util/error_404_constants.dart';
import 'package:flutter/material.dart';

class Error404FontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = Error404FontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: AppCss().nunitoTextStyle(
            color: color, fontWeight: fontWeight, fontSize: AppScreenUtil().fontSize(fontSize)));
  }

//mulish font family text layout
  Widget mulishtextLayout({
    String? text,
    color,
    double fontSize = Error404FontSize.textSizeMedium,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration textDecoration = TextDecoration.none,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize:  AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }

  //quicksand font family text layout
  Widget quicksandtextLayout(
      {String? text,
        color,
        double fontSize = Error404FontSize.textSizeMedium,
        FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: AppCss().quicksandTextStyle(
          color: color,
          fontSize:  AppScreenUtil().fontSize(fontSize),
          fontWeight:fontWeight
      ),
    );
  }
}
