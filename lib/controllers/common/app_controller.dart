import '../../config.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  var commonController = Get.isRegistered<CommonController>()
      ? Get.find<CommonController>()
      : Get.put(CommonController());
  bool isShimmer = true;
  int drawerSelectedIndex = 0;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isRTL = false;
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  List drawerList = [];
  List bottomNavigationList = [];
  String languageVal = "en";

  AppTheme get appTheme => _appTheme;
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
    String currencyCode = getStorage.read(Session.currencyCode) ?? 'INR';
    commonController.priceSymbol =
        getStorage.read(Session.currencySymbol) ?? '₹';
    commonController.priceConvertor(currencyCode, commonController.priceSymbol);

    drawerList = AppArray().drawerList;
    bottomNavigationList = AppArray().bottomNavigationList;
    commonController.update();
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
      commonController.showToast(e.toString());
      rethrow;
    } finally {
      hideLoading();
      update();
    }
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

  //on drawer change function
  onSelectIndex(index) {
    drawerSelectedIndex = index;
    update();
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
      commonController.bottomSheet();
    } else if (index == 6) {
      Get.back();
      commonController.currencyBottomSheet();
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
