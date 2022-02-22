import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/pages/splash_screen/util/splash_widget.dart';
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
         SplashWidget().backgroundImage(image: imageAssets.splashBGImage,height: 1.6,context: context),
          //splash logo Layout
          SplashWidget().splashLogo(image: imageAssets.logo,width: 4,context: context)
        ],
      ),
    );
  }
}