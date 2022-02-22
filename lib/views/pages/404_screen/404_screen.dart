import 'package:fastkart/app_extensions.dart';
import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/404_screen/util/404_constants.dart';
import 'package:fastkart/views/pages/404_screen/util/404_fontstyle.dart';
import 'package:fastkart/views/pages/404_screen/util/404_widget.dart';
import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              children: [
                Error404Widget().commonIconImage(
                  image: imageAssets.noPageFoundImage,
                ),
                Space(0, 15),
                Error404FontStyle().quicksandtextLayout(
                    text: Error404Font().pageNotFound,
                    fontSize: 20,
                    color: appCtrl.appTheme.titleColor,
                    fontWeight: FontWeight.w600),
                Space(0, 15),
                Error404FontStyle().quicksandtextLayout(
                    text: Error404Font().description,
                    fontSize: 14,
                    color: appCtrl.appTheme.darkContentColor,
                    fontWeight: FontWeight.normal),
                Space(0, 15),
                Error404Widget().backToHomeWidget(text: Error404Font().backToHome,color: appCtrl.appTheme.primary,fontColor: appCtrl.appTheme.whiteColor)
              ],
            ),
            Container(
              child: SizedBox(height: 20,),
            )
          ],
        ),
      ),
    );
  }
}
