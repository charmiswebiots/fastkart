import 'package:fastkart/views/pages/signup/util/dotted_line.dart';

import '../../../../config.dart';

class SignupStyle {
  //description text layout
  Widget descLayout(darkContentColor) {
    return SignupFontStyle().nunitotextLayout(
        text: SignupFont().description,
        color: darkContentColor,
        fontSize: SignupFontSize.textSizeSmall);
  }

  //register account text layout
  Widget registerAccountLayout(titleColor) {
    return SignupFontStyle().mulishtextLayout(
        text: SignupFont().registerAccount,
        color: titleColor,
        fontSize: SignupFontSize.textSizeMedium,
        fontWeight: FontWeight.w700);
  }

  //common image layout
  Widget commonImageLayout({var titleColor, String? image}) {
    return Image.asset(
      image!,
      fit: BoxFit.contain,
      color: titleColor,
      height: AppScreenUtil().screenHeight(10),
      width: AppScreenUtil().screenWidth(10),
    );
  }

  //already account layout
  Widget alreadyAccountWidget({
    color,
    GestureTapCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignupFontStyle().mulishtextLayout(
            color: color,
            text: SignupFont().alreadyAccount,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            onTap: onTap),
        SignupFontStyle().mulishtextLayout(
            color: color,
            text: SignupFont().signIn,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            textDecoration: TextDecoration.underline,
            onTap: onTap),
      ],
    );
  }

  //login with layout
  Widget loginWithLayout({color, fontColor}) {
    return Row(
      children: [
        DottedLineLayout(color: color,),
        Space(10, 0),
        SignupFontStyle().mulishtextLayout(
          color: fontColor,
          text: SignupFont().signInWith,
          fontWeight: FontWeight.w700,
          fontSize: SignupFontSize.textSizeSMedium,
        ),
        Space(10, 0),
        DottedLineLayout(color: color,),
      ],
    );
  }

  //common social button
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
      textWidget: LoginFontStyle().mulishtextLayout(
          text: text,
          color: titleColor,
          fontSize: LoginFontSize.textSizeMedium,
          fontWeight: FontWeight.bold),
    );
  }
}
