import 'dart:io';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/drawer/drawer_screen.dart';
import 'package:fastkart/views/pages/404_screen/util/404_constants.dart';
import 'package:fastkart/views/pages/404_screen/util/404_fontstyle.dart';
import 'package:fastkart/views/pages/404_screen/util/404_widget.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (_) {
        return Scaffold(
          drawer: DrawerScreen(),
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: appCtrl.appTheme.whiteColor,
            titleSpacing: 0,
            centerTitle: false,
            leading: Error404Widget().appBarLeadingLayput(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                borderColor: appCtrl.appTheme.titleColor,
                iconColor: appCtrl.appTheme.titleColor,
                image:
                    appCtrl.isTheme ? imageAssets.themeFkLogo : imageAssets.fkLogo),
            title: Error404Widget().appBarTitleLayout(
                image: appCtrl.isTheme ? imageAssets.themeLogo : imageAssets.logo,
                textColor: appCtrl.appTheme.titleColor),
            actions: [
              Error404Widget()
                  .appBarActionLayout(iconColor: appCtrl.appTheme.titleColor),
            ],
          ),
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: appCtrl.selectedIndex,
            onTap: (val) async {
              Get.back();
              Get.back();
              appCtrl.drawerSelectedIndex = 0;
              if (appCtrl.selectedIndex == 4) {
                Get.toNamed(routeName.myCart, arguments: false);
              } else  {
                await appCtrl.getStorage.write(
                    'selectedIndex', appCtrl.selectedIndex);
                appCtrl.selectedIndex = val;
                appCtrl.update();
              }
            },
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Platform.isIOS
                        ? MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(15)
                        : MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(20),
                    left: AppScreenUtil().screenHeight(15),
                    right: AppScreenUtil().screenHeight(15)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Error404Widget().commonIconImage(
                            image: imageAssets.noPageFoundImage, height: 100),
                        Space(0, 15),
                        Error404FontStyle().quicksandtextLayout(
                            text: Error404Font().pageNotFound,
                            fontSize: Error404FontSize.textSizeNormal,
                            color: appCtrl.appTheme.titleColor,
                            fontWeight: FontWeight.w600),
                        Space(0, 15),
                        Error404FontStyle().quicksandtextLayout(
                            text: Error404Font().description,
                            fontSize: Error404FontSize.textSizeSMedium,
                            color: appCtrl.appTheme.darkContentColor,
                            fontWeight: FontWeight.normal),
                        Space(0, 15),
                        Error404Widget().backToHomeWidget(
                            text: Error404Font().backToHome,
                            color: appCtrl.appTheme.primary,
                            fontColor: appCtrl.appTheme.whiteColor,
                            context: context)
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
