import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  bool isTheme = false;
  final storage = GetStorage();
  @override
  void onInit() async {

    await Future.delayed(Durations.s3);
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {


    // check which Language is selected
    String? languageCode = getStorage(Session.languageCode);
    String? countryCode = getStorage(Session.countryCode);
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
      print('localess : $locale');
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    update();
    bool? isLogin = await getStorage('isLogin');
    print(isLogin);
    /*if (isLogin != null && isLogin == true) {
      Get.toNamed(routeName.dashboard);
    } else {
      Get.toNamed(routeName.onBoarding);
    }*/
    Get.toNamed(routeName.onBoarding);
  }
}
