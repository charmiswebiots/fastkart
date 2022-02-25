import 'dart:io';

import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/404_screen/util/404_constants.dart';
import 'package:fastkart/views/pages/404_screen/util/404_fontstyle.dart';
import 'package:fastkart/views/pages/404_screen/util/404_widget.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: Platform.isIOS ? 40 : 30, left: 15, right: 15),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Error404Widget().commonIconImage(
                            image: iconAssets.category, height: 20),
                        Space(10, 0),
                        Error404Widget().commonIconImage(
                            image: imageAssets.smallLogoImage, height: 16),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Error404Widget().commonIconImage(
                            image: iconAssets.location, height: 16),
                        Space(5, 0),
                        Error404FontStyle().mulishtextLayout(
                            text: Error404Font().name,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        Space(5, 0),
                        Error404Widget()
                            .commonIconImage(image: iconAssets.user, height: 30),
                      ],
                    ),
                  ],
                ),
                Space(0, MediaQuery.of(context).size.height/6),
                Column(
                  children: [
                    Error404Widget().commonIconImage(
                      image: imageAssets.noPageFoundImage,
                    ),
                    Space(0, 15),
                    Error404FontStyle().quicksandtextLayout(
                        text: Error404Font().pageNotFound,
                        fontSize: Error404FontSize().textSizeNormal,
                        color: appCtrl.appTheme.titleColor,
                        fontWeight: FontWeight.w600),
                    Space(0, 15),
                    Error404FontStyle().quicksandtextLayout(
                        text: Error404Font().description,
                        fontSize: Error404FontSize().textSizeSMedium,
                        color: appCtrl.appTheme.darkContentColor,
                        fontWeight: FontWeight.normal),
                    Space(0, 15),
                    Error404Widget().backToHomeWidget(text: Error404Font().backToHome,color: appCtrl.appTheme.primary,fontColor: appCtrl.appTheme.whiteColor,context: context)
                  ],
                ),

              ],
            ),
          ),
          BottomNavigatorCard(selectedIndex: 0,onTap: (val){},)
        ],
      ),
    );
  }
}
