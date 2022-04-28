import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/myWishlist/util/mywishlist_constants.dart';
import 'package:fastkart/views/pages/myWishlist/util/mywishlist_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class MyWishlistWidget {
  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
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
              fontSize: AppScreenUtil().fontSize(15),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //popup detail layout
  Widget bottomSheetLayout({Widget? child,var primaryColor}){
    return Container(
      height: AppScreenUtil().screenHeight(150),
      padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(25),
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      child: child,
    );
  }

  //code display layout
  Widget codeLayout({Widget? child, var lightPrimary}){
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: lightPrimary,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }

  //copy Code style
  Widget copyCodeButton ({text,var whiteColor, var primaryColor}){
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(12),
          vertical: AppScreenUtil().screenHeight(6)),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(50))),
      child: MyWishListFontStyle().mulishtextLayout(
          text: text,
          color: primaryColor,
          fontSize: MyWishListFontSize.textSizeSMedium,
          fontWeight: FontWeight.bold),
    );
  }
}
