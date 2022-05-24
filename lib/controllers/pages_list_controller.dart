import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class PagesListController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final getStorage = GetStorage();

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //page name tap
  listTap(index) async {
    if (index == 0) {
      Get.toNamed(routeName.error404page);
    } else if (index == 1) {
      Get.toNamed(routeName.aboutUs);
    } else if (index == 2) {
      Get.toNamed(routeName.yourAccount);
    } else if (index == 3) {
      Get.toNamed(routeName.addAddress);
    } else if (index == 4) {
      Get.toNamed(routeName.addressList);
    } else if (index == 5) {
      Get.toNamed(
        routeName.myCart,
        arguments: true,
      );
    } else if (index == 6) {
      Get.back();
      await appCtrl.getStorage
          .write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = 1;
    } else if (index == 7) {
      Get.back();
      await appCtrl.getStorage
          .write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = 0;
    } else if (index == 8) {
      Get.toNamed(routeName.login);
    } else if (index == 9) {
      Get.toNamed(routeName.notification);
    } else if (index == 10) {
      Get.back();
      await appCtrl.getStorage
          .write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = 3;
    } else if (index == 11) {
      Get.toNamed(routeName.onBoarding);
    } else if (index == 12) {
      Get.toNamed(routeName.orderDetail);
    } else if (index == 13) {
      Get.toNamed(routeName.orderHistory);
    } else if (index == 14) {
      Get.toNamed(routeName.orderSuccess);
    } else if (index == 15) {
      Get.toNamed(routeName.orderTrack);
    } else if (index == 16) {
      Get.toNamed(routeName.paymentScreen);
    } else if (index == 17) {
      Get.toNamed(routeName.productDetail);
    } else if (index == 18) {
      Get.toNamed(routeName.signup);
    } else if (index == 19) {
      await appCtrl.getStorage
          .write('selectedIndex', appCtrl.selectedIndex);
      appCtrl.selectedIndex = 2;
    } else if (index == 20) {
      Get.toNamed(routeName.setting);
    } else if (index == 21) {
      Get.toNamed(routeName.shopScreen);
    } else if (index == 22) {
      Get.toNamed(routeName.myWishList);
    }
  }
}
