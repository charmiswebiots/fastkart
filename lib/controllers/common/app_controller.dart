import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool _isLoading = false;
  int drawerSelectedIndex = 0;
  int selectedIndex = 0;
  bool isTheme = false;
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  List drawerList = [];

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
    drawerList = AppArray().drawerList;
    update();
    super.onReady();
  }

  //get theme value
  getData() async {
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
    print('name : ${e['name']}');
    if (e['name'] == "English") {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
      getStorage.write(Session.languageCode, "en");
      getStorage.write(Session.countryCode, "US");
    } else if (e['name'] == "Arabic") {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
      getStorage.write(Session.languageCode, "ar");
      getStorage.write(Session.countryCode, "AE");
    }else if (e['name'] == "Korean") {
      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
      getStorage.write(Session.languageCode, "ko");
      getStorage.write(Session.countryCode, "KR");
    }else if (e['name'] == "Hindi") {
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      getStorage.write(Session.languageCode, "hi");
      getStorage.write(Session.countryCode, "IN");
    }

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
  bottomSheet({
    context,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const LanguageBottomSheet();
      },
    );
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
      bottomSheet(context: context);
    } else if (index == 6) {
      Get.back();
      Get.toNamed(routeName.yourAccount);
    } else if (index == 7) {
      Get.back();
      Get.toNamed(routeName.notification);
    } else if (index == 8) {
      Get.back();
      Get.toNamed(routeName.setting);
    } else if (index == 10) {
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
  errorBottomNavigationClick (val) async {
    Get.back();
    Get.back();
    drawerSelectedIndex = 0;
    if (selectedIndex == 4) {
      Get.toNamed(routeName.myCart, arguments: false);
    } else  {
      await getStorage.write(
          'selectedIndex', selectedIndex);
      selectedIndex = val;
      update();
    }
  }
}
