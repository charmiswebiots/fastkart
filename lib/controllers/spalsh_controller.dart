import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Durations.s3);
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
    String? languageCode = getStorage(Session.languageCode);
    String? countryCode = getStorage(Session.countryCode);
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
      print('localess : $locale');
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }


    Get.offAndToNamed(routeName.home);
    //#endregion

  }
}
