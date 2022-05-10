import 'package:fastkart/common/font_name.dart';
import 'package:fastkart/common/language/index.dart';
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


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
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
        translations: Language(),
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
