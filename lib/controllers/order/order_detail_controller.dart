import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class OrderDetailController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  List orderDetailList =[];
  bool isLoading = true;
  final getStorage = GetStorage();

  //go to home
  goToHome()async{
      Get.back();
      await getStorage.write('selectedIndex', 0);
      appCtrl.selectedIndex = 0;
    update();
  }

  //reorder tap
  reorder()async {
    await appCtrl.getStorage
        .write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    appCtrl.update();
    Get.offAllNamed(routeName.dashboard);
  }

  getData()async{
    orderDetailList = AppArray().orderDetailList;
    await Future.delayed(DurationsClass.s2);
    isLoading = false;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }
}