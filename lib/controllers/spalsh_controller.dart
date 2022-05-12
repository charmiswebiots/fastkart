import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }

    update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String? isIntro = await storage.read('isIntro');
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
