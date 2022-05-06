import 'package:fastkart/common/theme/index.dart';
import 'package:fastkart/routes/screen_list.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/drawer/util/drawer_constants.dart';
import 'package:fastkart/views/drawer/util/drawer_fontstyle.dart';
import 'package:fastkart/views/drawer/util/drawer_widget.dart';
import 'package:fastkart/views/pages/category/category_screen.dart';
import 'package:fastkart/views/pages/home_screen/home.dart';
import 'package:fastkart/views/pages/myCart/myCart_screen.dart';
import 'package:fastkart/views/pages/offers/offers_screen.dart';
import 'package:fastkart/views/pages/search/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool _isLoading = false;
  int drawerSelectedIndex = 0;
  int selectedIndex = 0;
  bool isTheme = false;
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  AppTheme get appTheme => _appTheme;

  bool get isLoading => _isLoading;
  final getStorage = GetStorage();

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    HomeLayout(),
    CategoryScreen(),
    SearchScreen(),
    OfferScreen(),
    MyCartListScreen(),
  ];

  @override
  void onReady() {
    //updateTheme(AppTheme.fromType(ThemeType.light));
    getData();
    super.onReady();
  }

  //get theme value
  getData() async {
    bool _loadThemeFromStorage = await getStorage.read('isDarkMode') ?? false;
    print('isDarkMode L ${_loadThemeFromStorage}');
    if (_loadThemeFromStorage) {
      isTheme = true;
    } else {
      isTheme = false;
    }
    update();
    await getStorage.write("isDarkMode", isTheme);

    ThemeService().switchTheme(isTheme);

    Get.forceAppUpdate();
    bool dddd = await getStorage.read('isDarkMode');
    print('ddddd ${dddd}');
  }


  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

  //show loader
  void showLoading() {
    _isLoading = true;
    update();
  }

  //hide loader
  void hideLoading() {
    _isLoading = false;
    update();
  }

  //on drawer change function
  onSelectIndex(index) {
    drawerSelectedIndex = index;
    update();
  }

  //bottom sheet for filter
  bottomSheet(
      {
        context,}) {
    showModalBottomSheet<void>(
      backgroundColor: appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return GetBuilder<AppController>(builder: (_) {
          return DrawerWidget().popLayout(
              context: context,

              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerFontStyle().mulishtextLayout(text: DrawerFont().selectLanguage,fontSize: DrawerFontSize().textSizeSMedium,color: appTheme.titleColor),
                    Space(0, 20),
                    ...AppArray().languageList.map((e) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
                        child: Row(
                          children: [
                            Image.asset(e['icon'].toString(),height: AppScreenUtil().screenHeight(20),),
                            Space(10, 0),
                            DrawerFontStyle().mulishtextLayout(text: e['name'],fontSize: DrawerFontSize().textSizeSMedium,color: appTheme.titleColor),
                          ],
                        ),
                      );
                    }).toList()
                  ],
                ),
              ));
        });
      },
    );
  }

  //select page index wise
  selectPage({index,context})async{
    onSelectIndex(index);
    if (index == 0) {
      Get.back();
      await getStorage
          .write('selectedIndex', selectedIndex);
      selectedIndex = 0;
    }else if (index == 1) {
      Get.back();
      Get.toNamed(routeName.pageList);
    }  else if (index == 2) {
      Get.back();
      await getStorage
          .write('selectedIndex', selectedIndex);
      selectedIndex = 1;
    } else if (index == 3) {
      Get.back();
      Get.toNamed(routeName.orderHistory);
    } else if (index == 4) {
      Get.back();
      Get.toNamed(routeName.myWishList);
    }else if (index == 5 ){
      Get.back();
      bottomSheet(context: context);
    }else if (index == 6) {
      Get.back();
      Get.toNamed(routeName.yourAccount);
    }else if (index == 7) {
      Get.back();
      Get.toNamed(routeName.notification);
    }else if (index == 8) {
      Get.back();
      Get.toNamed(routeName.setting);
    }else if (index == 10) {
      Get.back();
      selectedIndex = 0;
      auth.signOut();
      SharedPreferences prefs =
      await SharedPreferences.getInstance();
      prefs.setString('id', '');
      prefs.setString('isIntro', 'false');
      Get.offAllNamed(routeName.login);
      update();
    }
    update();
  }
}
