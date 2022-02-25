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
    return Platform.isIOS ? BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: BottomNavigationFontSize().textSizeSmall,
      unselectedItemColor: appCtrl.appTheme.whiteColor,
      backgroundColor: appCtrl.appTheme.primary,
      selectedItemColor: appCtrl.appTheme.whiteColor,
      selectedLabelStyle: TextStyle(fontSize: BottomNavigationFontSize().textSizeSmall),
      items: <BottomNavigationBarItem>[
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().home,
            imageIcon: iconAssets.home,
            height: 20,
            width: 20
        ),BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().category,
            imageIcon: iconAssets.white_category_icon,
            height: 20,
            width: 20
        ),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().search,
            imageIcon: iconAssets.search,
            height: 20,
            width: 20
        ),

        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().offers,
            imageIcon: iconAssets.offers,
            height: 20,
            width: 20
        ),
        BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().cart,
            imageIcon: iconAssets.cart,
            height: 20,
            width: 20
        ),
      ],
      currentIndex: selectedIndex!,
      onTap: onTap,
    ):  Container(
      height:65,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: BottomNavigationFontSize().textSizeSmall,
        unselectedItemColor: appCtrl.appTheme.whiteColor,
        backgroundColor: appCtrl.appTheme.primary,
        selectedItemColor: appCtrl.appTheme.whiteColor,
        selectedLabelStyle: TextStyle(fontSize: BottomNavigationFontSize().textSizeSmall),
        items: <BottomNavigationBarItem>[
          BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().home,
            imageIcon: iconAssets.home,
            height: 20,
            width: 20
          ),BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().category,
            imageIcon: iconAssets.home,
            height: 20,
            width: 20
          ),
          BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().search,
            imageIcon: iconAssets.search,
            height: 20,
            width: 20
          ),

          BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().offers,
            imageIcon: iconAssets.offers,
            height: 20,
            width: 20
          ),
          BottomNavigationWidget().bottomNavigationCard(
            color: appCtrl.appTheme.primary,
            text: BottomNavigationFont().cart,
            imageIcon: iconAssets.cart,
            height: 20,
            width: 20
          ),
        ],
        currentIndex: selectedIndex!,
        onTap: onTap,
      ),
    );
  }
}
