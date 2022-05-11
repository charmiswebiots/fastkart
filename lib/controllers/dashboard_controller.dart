import 'package:flutter/material.dart';

import '../config.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  String name = '';
  String lastname = '';
  String email = '';
  String alertCount = '';
  var appCtrl = Get.put(AppController());

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  //appbar leading function
  appBarLeadingFunction() async {
    print('tap');
    print(appCtrl.selectedIndex);
    if (appCtrl.selectedIndex == 3 || appCtrl.selectedIndex == 1) {
      int index = await appCtrl.getStorage.read('selectedIndex');
      print(index);
      appCtrl.selectedIndex = index;
      appCtrl.update();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
    update();
  }

  //actionTap
  actionTap() {
    if (appCtrl.selectedIndex == 0) {
      Get.toNamed(routeName.setting);
    } else if (appCtrl.selectedIndex == 1) {
      Get.toNamed(routeName.myCart, arguments: true);
    }
    update();
  }

  //botton change
  bottomNavigationChange(val) async {
    if (appCtrl.selectedIndex == 4) {
      Get.toNamed(routeName.myCart, arguments: false);
    } else {
      await appCtrl.getStorage.write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = val;
      appCtrl.update();
    }
    update();
  }
}
