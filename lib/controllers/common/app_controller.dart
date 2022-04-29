import 'package:fastkart/common/theme/index.dart';
import 'package:fastkart/routes/screen_list.dart';
import 'package:fastkart/views/pages/category/category_screen.dart';
import 'package:fastkart/views/pages/home_screen/home.dart';
import 'package:fastkart/views/pages/myWishlist/mywishlist_screen.dart';
import 'package:fastkart/views/pages/offers/offers_screen.dart';
import 'package:fastkart/views/pages/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool _isLoading = false;
  int drawerSelectedIndex = 0;
  int selectedIndex = 0;
  bool isTheme = false;

  AppTheme get appTheme => _appTheme;

  bool get isLoading => _isLoading;
  final getStorage = GetStorage();

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    HomeLayout(),
    CategoryScreen(),
    SearchScreen(),
    OfferScreen(),
    MyWishListScreen(),
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
}
