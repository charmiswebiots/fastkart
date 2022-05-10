import 'dart:io';
import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';

//Widget Layout
class LoginWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //login background image layout
  Widget loginBackGroundImage(String image, context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
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
        : Image.asset(imageAssets.smallLogoImage);
  }

  //sign in button
  Widget signInButton({
    color,
    BuildContext? context,
    fontColor,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().size(10)),
        width: MediaQuery.of(context!).size.width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: LoginFontStyle().mulishtextLayout(
            text: LoginFont().signIn,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }

  //fogot password widget
  Widget forgotPasswordWidget({color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LoginFontStyle().mulishtextLayout(
            text: LoginFont().forgotPassword,
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        Space(0, 15),
      ],
    );
  }

  //create new user layout
  Widget createUserWidget({
    color,
    fontWeight,
    GestureTapCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginFontStyle().mulishtextLayout(
            color: color,
            text: LoginFont().creatUser,
            fontWeight: fontWeight,
            fontSize: 14,
            onTap: onTap),
        Space(1.5, 0),
        LoginFontStyle().mulishtextLayout(
            color: color,
            text: LoginFont().createNow,
            fontWeight: fontWeight,
            fontSize: 14,
            textDecoration: TextDecoration.underline,
            onTap: onTap),
      ],
    );
  }

//contiune as guest
  Widget continueAsGuest({color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 10.0 : 0),
      child: LoginFontStyle()
          .mulishtextLayout(
              text: LoginFont().continueAsGuest,
              color: color,
              fontSize: LoginFontSize.textSizeSMedium,
              textDecoration: TextDecoration.underline)
          .marginOnly(bottom: 10),
    );
  }
}
