import 'package:fastkart/config.dart';
class LoginFontStyle {

  //nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = LoginFontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: AppCss().nunitoTextStyle(
            color: color, fontWeight: fontWeight, fontSize: fontSize));
  }

  //mulish font family text layout
  Widget mulishtextLayout({
    String? text,
    color,
    double fontSize = LoginFontSize.textSizeMedium,
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
              fontSize: fontSize,
              textDecoration: textDecoration)),
    );
  }
}
