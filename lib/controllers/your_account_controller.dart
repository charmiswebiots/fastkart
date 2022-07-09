import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class YourAccountController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final getStorage = GetStorage();

  //go to home
  goToHome()async{
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //bottom navigation click
  bottomNavigationClick(val) async {
    Get.back();
    Get.back();
    if (appCtrl.selectedIndex == 4) {
      Get.toNamed(routeName.myCart, arguments: false);
    } else {
      Get.back();
      await appCtrl.getStorage.write(
          'selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = val;
      appCtrl.update();
    }
    appCtrl.update();
  }

  //logout function
  logout() {
    Get.back();
    Get.offAllNamed(routeName.login);
  }

  //page name tap
  pageNameTap (index,context) async {
    appCtrl
        .onSelectIndex(index);
    if (index == 0) {
      await appCtrl.getStorage
          .write(
          'selectedIndex', appCtrl.selectedIndex);
      appCtrl.update();
    } else if (index == 1) {
      Get.back();
      Get.toNamed(routeName.pageList);
    } else if (index == 2) {
      Get.back();
      await appCtrl.getStorage
          .write(
          'selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = 1;
    } else if (index == 3) {
      Get.back();
      Get.toNamed(routeName.orderHistory);
    } else if (index == 4) {
      Get.back();
      Get.toNamed(routeName.myWishList);
    } else if (index == 5) {
      appCtrl
          .commonController.bottomSheet();
    } else if (index == 6) {
      appCtrl
          .commonController.currencyBottomSheet();
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
      Get.offAllNamed(routeName.login);
    }
    appCtrl.update();
  }
}