
import 'package:fastkart/config.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupFontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
        color,
        double fontSize = SignupFontSize.textSizeMedium,
        FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: TextStyle(
        color: color, fontSize: AppScreenUtil().fontSize(fontSize), fontWeight: fontWeight,
        fontFamily: GoogleFonts.nunitoSans().fontFamily)
    );
  }

//mulish font family text layout
  Widget mulishtextLayout(
      {String? text,
        color,
        double fontSize = SignupFontSize.textSizeMedium,
        FontWeight fontWeight = FontWeight.normal,
        TextDecoration textDecoration = TextDecoration.none,GestureTapCallback? onTap,}) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }
}