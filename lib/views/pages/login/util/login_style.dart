import 'dart:io';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config.dart';
import '../../../../utilities/responsive_layout.dart';
import '../../../../widgets/common/icon_button_widget.dart';

class LoginStyle {
  //body style
  Widget bodyStyle({context, var color, loginformKey, Widget? child}) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height /
              (Platform.isIOS ? 9.2 : AppScreenUtil().size(7.2))),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().size(15),
          vertical: AppScreenUtil().size(25)),
      width: MediaQuery.of(context).size.width,
      height: AppScreenUtil().screenActualHeight(),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppScreenUtil().borderRadius(22)),
              topRight: Radius.circular(AppScreenUtil().borderRadius(22)))),
      child: Form(
        key: loginformKey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height /
                  AppScreenUtil().screenHeight(
                      (ResponsiveWidget.isSmallScreen(context)) ? 1.52 : 1.14),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  //description text layout
  Widget descLayout(darkContentColor) {
    return LoginFontStyle().nunitotextLayout(
        text: LoginFont().description,
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
        fontSize: LoginFontSize.textSizeMedium,
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
}
