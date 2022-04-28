import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/bottom_navigation/util/bottom_navigation_constants.dart';
import 'package:fastkart/views/pages/bottom_navigation/util/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class BottomNavigatorCard extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int? selectedIndex;
  ValueChanged<int>? onTap;

  BottomNavigatorCard({
    Key? key,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return GetBuilder<AppController>(builder: (_) => Platform.isIOS
        ? BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: BottomNavigationFontSize().textSizeSmall,
      unselectedItemColor: appCtrl.appTheme.white.withOpacity(.8),
      backgroundColor: appCtrl.appTheme.primary,
      selectedItemColor: appCtrl.appTheme.white,
      selectedLabelStyle: TextStyle(
          fontSize: BottomNavigationFontSize().textSizeSmall,
          fontWeight:
          selectedIndex == 0 ? FontWeight.w800 : FontWeight.normal),
      items: <BottomNavigationBarItem>[
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().home,
            imageIcon: iconAssets.home,
            imagecolor: selectedIndex == 0 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
            height: 20,
            width: 20),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().category,
            imagecolor: selectedIndex == 1 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
            imageIcon: iconAssets.search,
            height: 20,
            width: 20),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().search,
            imageIcon: iconAssets.search,
            imagecolor: selectedIndex == 2 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
            height: 20,
            width: 20),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().offers,
            imageIcon: gifAssets.offers,
            imagecolor: selectedIndex == 3 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),

            height: 20,
            width: 20),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().cart,
            imageIcon: iconAssets.cart,
            imagecolor: selectedIndex == 4 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
            height: 20,
            width: 20),
      ],
      currentIndex: selectedIndex!,
      onTap: onTap,
    )
        : Container(
      height: AppScreenUtil().screenHeight( AppScreenUtil().screenActualWidth() > 370 ? 58: 65),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: BottomNavigationFontSize().textSizeSmall,
        unselectedItemColor: appCtrl.appTheme.white.withOpacity(.8),
        backgroundColor: appCtrl.appTheme.primary,
        selectedItemColor: appCtrl.appTheme.white,
        selectedLabelStyle: TextStyle(
            fontSize: BottomNavigationFontSize().textSizeSmall,
            fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          BottomNavigationWidget().bottomNavigationCard(
              color: appCtrl.appTheme.primary,
              text: BottomNavigationFont().home,
              imagecolor: selectedIndex == 0 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
              imageIcon: iconAssets.home,
              height: 20,
              width: 20),
          BottomNavigationWidget().bottomNavigationCard(
              color: appCtrl.appTheme.primary,
              text: BottomNavigationFont().category,
              imagecolor: selectedIndex == 1 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
              imageIcon: iconAssets.category,
              height: 20,
              width: 20),
          BottomNavigationWidget().bottomNavigationCard(
              color: appCtrl.appTheme.primary,
              text: BottomNavigationFont().search,
              imageIcon: iconAssets.search,
              imagecolor: selectedIndex == 2 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
              height: 20,
              width: 20),
          BottomNavigationWidget().bottomNavigationCard(
              color: appCtrl.appTheme.primary,

              text: BottomNavigationFont().offers,
              imageIcon: gifAssets.offers,
              imagecolor: selectedIndex == 3 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
              height: 25,
              width: 25),
          BottomNavigationWidget().bottomNavigationCard(
              color: appCtrl.appTheme.primary,
              text: BottomNavigationFont().cart,
              imageIcon: iconAssets.cart,
              imagecolor: selectedIndex == 4 ? appCtrl.appTheme.white :appCtrl.appTheme.white.withOpacity(.8),
              height: 20,
              width: 20),
        ],
        currentIndex: selectedIndex!,
        onTap: onTap,
      ),
    ),);
  }
}
