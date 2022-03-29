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

    bool? isLogin = await getStorage('isLogin') ?? null;
    print(isLogin);
    if (isLogin != null && isLogin == true) {
      Get.toNamed(routeName.home);
    } else {
      Get.toNamed(routeName.onBoarding);
    }
  }


}
