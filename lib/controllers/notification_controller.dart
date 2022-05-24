import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TabController? tabController;
  List notificationList = [];
  bool isLoading = true;

  final getStorage = GetStorage();

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //get data
  getData() async {
    notificationList = AppArray().notificationList;

    update();
    await Future.delayed(Durations.s2);
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
