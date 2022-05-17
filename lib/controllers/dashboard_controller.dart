import '../config.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  String name = '';
  String lastname = '';
  String email = '';
  String alertCount = '';
  var appCtrl = Get.put(AppController());
  bool isLoading = false;

  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  //appbar leading function
  appBarLeadingFunction() async {
    if (appCtrl.selectedIndex == 3 || appCtrl.selectedIndex == 1) {
      int index = await appCtrl.getStorage.read('selectedIndex');
      appCtrl.selectedIndex = index;
      appCtrl.update();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
    update();
  }

  //actionTap
  actionTap() {
    if (appCtrl.selectedIndex == 0) {
      Get.toNamed(routeName.setting);
    } else if (appCtrl.selectedIndex == 1) {
      Get.toNamed(routeName.myCart, arguments: true);
    }
    update();
  }

  //botton change
  bottomNavigationChange(val) async {
    if (appCtrl.selectedIndex == 4) {
      Get.toNamed(routeName.myCart, arguments: false);
    } else {
      await appCtrl.getStorage.write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = val;
      appCtrl.update();
    }
    update();
  }
}
