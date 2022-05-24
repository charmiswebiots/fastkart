import 'dart:convert';

import 'package:fastkart/views/drawer/drawer_layout/currency_bottomsheet.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool _isLoading = false;
  bool isShimmer = true;
  int drawerSelectedIndex = 0;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isRTL = false;
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  List drawerList = [];
  List bottomNavigationList = [];
  double rateValue = 0.0;
  String priceSymbol = "₹";
  String languageVal = "en";

  AppTheme get appTheme => _appTheme;

  bool get isLoading => _isLoading;
  final getStorage = GetStorage();

  //list of bottomnavigator page
  List<Widget> widgetOptions = <Widget>[
    const HomeLayout(),
    const CategoryScreen(),
    const SearchScreen(),
    const OfferScreen(),
    const MyCartListScreen(),
  ];

  @override
  void onReady() {
    //updateTheme(AppTheme.fromType(ThemeType.light));
    getData();

    super.onReady();
  }

  //get theme value
  getData() async {
    isShimmer = true;
    update();
    //language check
    // check which Language is selected
    String? languageCode = storage.read(Session.languageCode);
    languageVal = storage.read(Session.languageCode) ?? 'en';
    String? countryCode = storage.read(Session.countryCode);

    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    update();

    //theme check
    bool _loadThemeFromStorage = getStorage.read('isDarkMode') ?? false;
    if (_loadThemeFromStorage) {
      isTheme = true;
    } else {
      isTheme = false;
    }

    update();
    await getStorage.write("isDarkMode", isTheme);
    ThemeService().switchTheme(isTheme);
    Get.forceAppUpdate();
    await getStorage.read('isDarkMode');
    String currencyCode = await getStorage.read(Session.currencyCode) ?? 'INR';
    priceSymbol = getStorage.read(Session.currencySymbol) ?? '₹';
    priceConvertor(currencyCode, priceSymbol);

    drawerList = AppArray().drawerList;
    bottomNavigationList = AppArray().bottomNavigationList;

    update();
  }

  //google Login function
  googleLogin() async {
    showLoading();
    update();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      (await _auth.signInWithCredential(credential)).user;
      hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      hideLoading();
      update();
      showToast(e.toString());
      rethrow;
    } finally {
      hideLoading();
      update();
    }
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }

  //language selection
  languageSelection(e) async {
    if (e['name'] == "English" ||
        e['name'] == 'अंग्रेजी' ||
        e['name'] == 'انجليزي' ||
        e['name'] == '영어') {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
      languageVal = "en";
      getStorage.write(Session.languageCode, "en");
      getStorage.write(Session.countryCode, "US");
    } else if (e['name'] == "Arabic" ||
        e['name'] == 'अरबी' ||
        e['name'] == 'عربي' ||
        e['name'] == '아랍어') {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
      languageVal = "ar";
      getStorage.write(Session.languageCode, "ar");
      getStorage.write(Session.countryCode, "AE");
    } else if (e['name'] == "Korean" ||
        e['name'] == 'कोरियाई' ||
        e['name'] == 'كوري' ||
        e['name'] == '한국어') {
      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
      languageVal = "ko";
      getStorage.write(Session.languageCode, "ko");
      getStorage.write(Session.countryCode, "KR");
    } else if (e['name'] == "Hindi" ||
        e['name'] == 'हिंदी' ||
        e['name'] == 'هندي' ||
        e['name'] == '힌디어') {
      languageVal = "hi";
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      getStorage.write(Session.languageCode, "hi");
      getStorage.write(Session.countryCode, "IN");
    }
    Get.forceAppUpdate();
    drawerList = AppArray().drawerList;
    bottomNavigationList = AppArray().bottomNavigationList;
    update();
    Get.back();
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);
    update();
    Get.toNamed(routeName.dashboard);
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
  bottomSheet() {
    BottomSheetLayout().bottomSheet(
        child: const LanguageBottomSheet());
  }

  //currency bottom sheet for filter
  currencyBottomSheet() {
    BottomSheetLayout().bottomSheet(
        child: const CurrencyBottomSheet());
  }

  priceConvertor(to, currencySymbol) async {
    String from = getStorage.read(Session.currencyCode) ?? 'INR';
    final response = await http.get(Uri.parse(
        'https://free.currconv.com/api/v7/convert?q=${from}_$to&compact=ultra&apiKey=822b16f7746c9ebae65d'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      final rate = jsonResponse[from + '_' + to].toDouble();
      rateValue = rate;
      priceSymbol = currencySymbol;
      update();
      await getStorage.write(Session.currencyCode, to);
      await getStorage.write(Session.currencySymbol, currencySymbol);
      // return double.parse((rate * 25).toStringAsFixed(2));
    } else {
      throw Exception('Error');
    }
  }

  //select page index wise
  selectPage({index, context}) async {
    onSelectIndex(index);
    if (index == 0) {
      Get.back();
      await getStorage.write('selectedIndex', selectedIndex);
      selectedIndex = 0;
    } else if (index == 1) {
      Get.back();
      Get.toNamed(routeName.pageList);
    } else if (index == 2) {
      Get.back();
      await getStorage.write('selectedIndex', selectedIndex);
      selectedIndex = 1;
    } else if (index == 3) {
      Get.back();
      Get.toNamed(routeName.orderHistory);
    } else if (index == 4) {
      Get.back();
      Get.toNamed(routeName.myWishList);
    } else if (index == 5) {
      Get.back();
      bottomSheet();
    } else if (index == 6) {
      Get.back();
      currencyBottomSheet();
    } else if (index == 7) {
      Get.back();
      Get.toNamed(routeName.yourAccount);
    } else if (index == 8) {
      Get.back();
      Get.toNamed(routeName.notification);
    } else if (index == 9) {
      Get.back();
      Get.toNamed(routeName.setting);
    } else if (index == 12) {
      Get.back();
      selectedIndex = 0;
      auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', '');
      prefs.setString('isIntro', 'false');
      Get.offAllNamed(routeName.login);
      update();
    }
    update();
  }

  //error bottom navigation bar click
  errorBottomNavigationClick(val) async {
    Get.back();
    Get.back();
    drawerSelectedIndex = 0;
    if (selectedIndex == 4) {
      Get.toNamed(routeName.myCart, arguments: false);
    } else {
      await getStorage.write('selectedIndex', selectedIndex);
      selectedIndex = val;
      update();
    }
  }
}
