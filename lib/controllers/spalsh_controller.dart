import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // check which Language is selected
    String? languageCode = storage.read(Session.languageCode);
    String? countryCode = storage.read(Session.countryCode);
    print('languageCode : $languageCode');
    print('countryCode : $countryCode');
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
      print('localess : $locale');
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }

    update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String? isIntro = await storage.read('isIntro');
    print("AAA");
    print("isIntro : $isIntro");
    print(user);
    if (isIntro == "false" || isIntro == null) {
      Get.toNamed(routeName.onBoarding);
    } else {
      if (user == null) {
        // Cheking if user is already login or not
        Get.toNamed(routeName.login);
      } else {
        Get.toNamed(routeName.dashboard);
      }
    }

  }
}
