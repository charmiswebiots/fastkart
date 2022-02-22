import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/image_layout/background_image.dart';
import 'package:fastkart/views/pages/splash_screen/splash_logo.dart';
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
        children:  [
          //Back Image Layout
          BackgroundImage(image: imageAssets.splashBGImage,height: 1.6,),
          //splash logo Layout
          SplashLogo()
        ],
      ),
    );
  }
}