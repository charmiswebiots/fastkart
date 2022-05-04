import 'package:fastkart/config.dart';

class OrderTrackController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
}