import 'dart:io';

import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_widget.dart';
import 'package:fastkart/widgets/common_appbar_widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';

class HomeLayout extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Platform.isIOS
                    ? MediaQuery.of(context).size.height / 15
                    : MediaQuery.of(context).size.height / 20,
                left: 15,
                right: 15),
            child: Column(
              children: [
                CommonAppBar1(
                  onTap: () {},
                ),
                Space(0, 10),
                //fullname textformfiel layout
                HomeWidget().textFieldLayout(
                  suffixIcon: Image.asset(iconAssets.voice),
                  prefixIcon: Image.asset(iconAssets.textboxSearchIcon),
                  text: HomeFont().searchProduct,
                  borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                  hintColor: appCtrl.appTheme.contentColor,
                  fillcolor: appCtrl.appTheme.lightGray,
                ),
                Space(0, 20),
                HomeWidget().recentBoughtListWiget(
                  context: context,
                  containercolor: appCtrl.appTheme.lightPrimary,
                  bordercolor: appCtrl.appTheme.recentBGColor,
                  titlecolor: appCtrl.appTheme.titleColor,
                  title: HomeFont().recentBought,
                  list: AppArray().recentBoughtList,
                  listcontainercolor: appCtrl.appTheme.whiteColor,
                ),
                Space(0, 25),
                //recent bought widget

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: appCtrl.appTheme.greyBGColor,width: 2),
                        ),
                      ),
                    ),
                    HomeWidget().shopByCategory(
                        text: HomeFont().shopByCategory,
                        color: appCtrl.appTheme.titleColor),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: appCtrl.appTheme.greyBGColor,width: 2),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          BottomNavigatorCard(
            selectedIndex: 0,
            onTap: (val) {},
          )
        ],
      ),
    );
  }
}
