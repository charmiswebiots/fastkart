import 'package:google_fonts/google_fonts.dart';
import '../../../../config.dart';

class LoginStyle {

  //description text layout
  Widget descLayout(darkContentColor) {
    return LoginFontStyle().nunitotextLayout(
        text: LoginFont().description.tr,
        color: darkContentColor,
        fontSize: LoginFontSize.textSizeSmall);
  }

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

  //login account text layout
  Widget loginText(titleColor) {
    return LoginFontStyle().mulishtextLayout(
        text: LoginFont().loginAccount,
        color: titleColor,
        fontSize: LoginFontSize.textSizeSMedium,
        fontWeight: FontWeight.w700);
  }

  //common icon style
  Widget commonIcon({var color, bool? isPassword, bool? passwordVisible}) {
    return isPassword!
        ? Image.asset(
            passwordVisible! ? iconAssets.hide : iconAssets.view,
            color: color,
          )
        : Image.asset(
            iconAssets.atsign,
            color: color,
          );
  }

  //logo
  Widget logoImage(isTheme) {
    return isTheme
        ? Image.asset(
      imageAssets.themeLogo,
      fit: BoxFit.contain,
      height: AppScreenUtil().screenHeight(20),
    )
        : Image.asset(imageAssets.smallLogoImage,
      fit: BoxFit.contain,
      height: AppScreenUtil().screenHeight(20),);
  }
}
