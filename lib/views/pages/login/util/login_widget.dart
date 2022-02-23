import 'package:dotted_line/dotted_line.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class LoginWidget {

  //login background image layout
  Widget loginBackGroundImage(String image, context) {
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

  //sign in button
  Widget signInButton({color, BuildContext? context, fontColor,GestureTapCallback? onTap,}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
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
        Space(0, 20),
      ],
    );
  }

  //create new user layout
  Widget createUserWidget({color,GestureTapCallback? onTap,}) {
    return Center(
      child: LoginFontStyle().mulishtextLayout(
        color: color,
        text: LoginFont().creatUser,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        onTap: onTap
      ),
    );
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
        LoginFontStyle().mulishtextLayout(
          color: fontColor,
          text: LoginFont().signInWith,
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
    return LoginFontStyle()
        .mulishtextLayout(
            text: LoginFont().continueAsGuest,
            color: color,
            fontSize: 14,
            textDecoration: TextDecoration.underline)
        .marginOnly(bottom: 10);
  }
}
