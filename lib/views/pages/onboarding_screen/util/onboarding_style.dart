import 'package:google_fonts/google_fonts.dart';

import '../../../../config.dart';

class OnboardingStyle{

  //social login button
  Widget socialButton(
      {GestureTapCallback? onTap,
        var titleColor,
        String? text,
        String? type,
        String? icon}) {
    return IconButtonWidget(
      lefMargin: 0,
      onTap: onTap,
      rightMargin: 0,
      icon: icon,
      type: text,
      textWidget: Text(text!,style: TextStyle(
        color: titleColor,
        fontFamily: GoogleFonts.mulish().fontFamily,
        fontSize: AppScreenUtil().fontSize(LoginFontSize.textSizeSMedium),
        fontWeight: FontWeight.bold, )),

    );
  }

}