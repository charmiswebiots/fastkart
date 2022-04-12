import 'package:fastkart/views/drawer/util/drawer_constants.dart';
import 'package:fastkart/views/drawer/util/drawer_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class DrawerWidget {

  //user image layout
  Widget userImageLayout(
      {double? borderRaius, var image, double? imageHeight}) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(AppScreenUtil().borderRadius(borderRaius!)),
      child: Image.asset(
        image,
        height: AppScreenUtil().screenHeight(imageHeight!),
        fit: BoxFit.fill,
      ),
    );
  }

  //username and email layout
  Widget userNameAndEmailLayout(
      {String? userName,
      String? userEmail,
      var userNameFontColor,
      var emailFontColor,
      double? nameFontSize,
      double? emailFontSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerFontStyle().mulishtextLayout(
          text: userName,
          fontSize: nameFontSize!,
          fontWeight: FontWeight.w700,
          color: userNameFontColor,
        ),
        DrawerFontStyle().mulishtextLayout(
          text: userEmail,
          fontSize: emailFontSize!,
          color: emailFontColor,
        ),
      ],
    );
  }

  // divider line layout
  Widget dividerLineLayout({double? height,double? horizontalPadding,var color}){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(horizontalPadding!)),
      child: Divider(
        height: AppScreenUtil().screenHeight(height!),
        color: color,
        thickness: 1,
      ),
    );
  }

  //common Image Layout
  Widget commonImageLayout({String? image,double? height,var iconColor}){
    return image == 'assets/icons/language.png' ? Image.asset(image!,height: AppScreenUtil().screenHeight(height!)) : Image.asset(image!,height:AppScreenUtil().screenHeight(height!),color: iconColor,);
}

  //forward arrow icon container
  Widget forwardArrow({var color}){
    return Container(
        padding: EdgeInsets.all(AppScreenUtil().screenWidth(5)),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(50))
        ),
        child: Icon(Icons.arrow_forward_ios_outlined,size: 14,));
  }

  //common drawer listtile
  Widget commonDrawerListTile({String? image,String? title,GestureTapCallback? onTap,var color,var iconColor,double? height,double? fontSize}){
    return InkWell(
      onTap: onTap,
      child: ListTile(
        horizontalTitleGap: 0,
        leading: commonImageLayout(image: image,height: height,iconColor:iconColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerFontStyle().mulishtextLayout(text: title,fontSize:  fontSize!),
            forwardArrow(color:color )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  //contact support text layout
  Widget contactSupport({String? title,double? fontSize,var color}){
    return DrawerFontStyle().mulishtextLayout(
        text: DrawerFont().contactSupport,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: color
    );
  }

  //contact us button Layout
 Widget contactUsButtonLayout({GestureTapCallback? onTap,var buttonColor,var textColor,String? text}){
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: AppScreenUtil().screenWidth(150),
        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
        ),
        child: DrawerFontStyle().mulishtextLayout(
            color: textColor,
            text: text,
            fontSize: 10,
            fontWeight: FontWeight.w700
        ),
      ),
    );
 }
}
