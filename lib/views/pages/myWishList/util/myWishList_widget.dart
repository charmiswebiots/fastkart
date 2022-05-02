import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/myWishList/util/myWishList_fontstyle.dart';
import 'package:fastkart/views/pages/myWishList/util/myWishList_fontstyle.dart';
import 'package:fastkart/views/pages/myWishList/util/mywishlist_constants.dart';
import 'package:fastkart/views/pages/myWishList/util/mywishlist_constants.dart';
import 'package:flutter/material.dart';

//Widget Layout
class MyWishListWidget {


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

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}){
    return MyWishListFontStyle().mulishtextLayout(
        text: text,
        color:
        color,
        fontSize: MyWishListFontSize.textSizeSMedium,
        fontWeight: fontWeight);
  }

}
