import 'package:fastkart/common/font_name.dart';
import 'package:fastkart/routes/index.dart';
import 'package:fastkart/views/pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fastkart/common/theme/app_theme.dart';
import 'package:fastkart/common/theme/theme_service.dart';
import 'package:get_storage/get_storage.dart';

Future main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyDW99lYfW2J23gSMzHk8TYSQuR_3oNfYIk",
  //         authDomain: "fastkart-e69da.firebaseapp.com",
  //         projectId: "fastkart-e69da",
  //         storageBucket: "fastkart-e69da.appspot.com",
  //         messagingSenderId: "442123674229",
  //         appId: "1:442123674229:web:c871c0ad182b43c2c68e3c",
  //         measurementId: "G-KP32F6B2V0"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'), // tran
        title: FontName().appName,
        home: SplashScreen(),
        getPages: appRoute.getPages,
        theme: AppTheme.fromType(ThemeType.light).themeData,
        darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
        themeMode: ThemeService().theme,
      ),
    );
  }

  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
