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
