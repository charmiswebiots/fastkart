import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TabController? tabController;
  List notificationList = [];

  final getStorage = GetStorage();

  //go to home
  goToHome()async{
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    notificationList = AppArray().notificationList;
    update();
    super.onInit();
  }
}