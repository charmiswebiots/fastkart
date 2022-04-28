import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/pages/splash_screen/util/splash_widget.dart';
import 'package:flutter/material.dart';

import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/spalsh_controller.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splashCtrl = Get.put(SplashController());


  @override
  void initState() {
    // TODO: implement initState
   getTheme();
    super.initState();
  }

  getTheme()async{
    bool _loadThemeFromStorage = await splashCtrl.storage.read('isDarkMode') ?? false;
    print('isDarkMode : ${_loadThemeFromStorage}');
    splashCtrl.update();
    if (_loadThemeFromStorage) {
      splashCtrl.isTheme = true;
    } else {
      splashCtrl.isTheme = false;
    }
    splashCtrl.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (_) => Stack(
        children:  [
          //Back Image Layout
          SplashWidget().backgroundImage(image: imageAssets.splashBGImage,height: 1.6,context: context),
          //splash logo Layout
          splashCtrl.isTheme ?SplashWidget().splashLogo(image: imageAssets.themeLogo,width: 3.5,context: context) :SplashWidget().splashLogo(image: imageAssets.logo,width: 4,context: context)

        ],
      ),),
    );
  }
}