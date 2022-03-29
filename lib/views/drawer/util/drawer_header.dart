import 'package:fastkart/views/drawer/util/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class DrawerCustomHeader extends StatelessWidget {
  String? image;
  double? borderRaius;
  double? imageHeight;
  String? userName;
  String? userEmail;
  var userNameFontColor;
  var emailFontColor;
  double? nameFontSize;
  double? emailFontSize;

  DrawerCustomHeader({Key? key,this.userEmail,this.userName,this.emailFontSize,this.nameFontSize,this.emailFontColor,this.userNameFontColor,this.imageHeight,this.image,this.borderRaius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //user Image layout
        DrawerWidget().userImageLayout(
            borderRaius: 50, image: imageAssets.usersquare, imageHeight: 50),
        Space(10, 0),

        //user name and email layout
        DrawerWidget().userNameAndEmailLayout(
            userName: userName,
            userEmail: userEmail,
            userNameFontColor: userNameFontColor,
            emailFontColor: emailFontColor,
            nameFontSize: nameFontSize,
            emailFontSize: emailFontSize),
      ],
    ).paddingOnly(
        top: MediaQuery.of(context).size.height /
            AppScreenUtil().screenHeight(14),
        left: AppScreenUtil().screenWidth(30),
        right: AppScreenUtil().screenWidth(25));
  }
}
