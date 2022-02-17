import 'package:fastkart/views/splash_screen/splash_back_image.dart';
import 'package:fastkart/views/splash_screen/splash_logo.dart';
import 'package:flutter/material.dart';

import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/spalsh_controller.dart';

class SplashScreen extends StatelessWidget {
  var splashCtrl = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          //Back Image Layout
          SplashBGImage(),

          //Logo Layout
          SplashLogo()
        ],
      ),
    );
  }
}
