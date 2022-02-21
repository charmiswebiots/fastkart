import 'package:dotted_line/dotted_line.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/signup/util/signup_constants.dart';
import 'package:fastkart/views/pages/signup/util/signup_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class SignupWidget {

  //signup background image layout
  Widget signupBackGroundImage(String image, context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }

  //White body Container Layout
  Widget bodyContainer({Widget? child, BuildContext? context, color}) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context!).size.height / 8.5),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22))),
      child: child,
    );
  }

  //textformfield layout
  Widget textFieldLayout(
      {String? text, fillcolor, borderColor, hintColor, Widget? suffixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          suffixIcon: suffixIcon,
          fillColor: fillcolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
              fontSize: 15,
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //sign up button
  Widget signUpButton({color, BuildContext? context, fontColor}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.of(context!).size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: SignupFontStyle().mulishtextLayout(
          text: SignupFont().signup,
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: fontColor),
    );
  }

  //fogot password widget
  Widget forgotPasswordWidget({color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SignupFontStyle().mulishtextLayout(
            text: SignupFont().forgotPassword,
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        Space(0, 20),
      ],
    );
  }

  //already account layout
  Widget alreadyAccountWidget({color,GestureTapCallback? onTap,}) {
    return Center(
      child: SignupFontStyle().mulishtextLayout(
        color: color,
        text: SignupFont().alreadyAccount,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        onTap: onTap
      ),
    );
  }

  //social signup button
  Widget socialLoginButton({containerColor, String? icon, String? text}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon!),
          Space(10, 0),
          SignupFontStyle().mulishtextLayout(text: text)
        ],
      ),
    ).marginOnly(left: 0, right: 0).gestures(onTap: () {});
  }

  //signup with layout
  Widget signupWithLayout({color, fontColor}) {
    return Row(
      children: [
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 4,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        ),
        Space(10, 0),
        SignupFontStyle().mulishtextLayout(
          color: fontColor,
          text: SignupFont().signInWith,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        Space(10, 0),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 4,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        )
      ],
    );
  }

//contiune as guest
  Widget continueAsGuest({color}) {
    return SignupFontStyle()
        .mulishtextLayout(
            text: SignupFont().continueAsGuest,
            color: color,
            fontSize: 14,
            textDecoration: TextDecoration.underline)
        .marginOnly(bottom: 10);
  }
}