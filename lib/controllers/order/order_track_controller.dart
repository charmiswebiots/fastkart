import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class OrderTrackController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
bool isLoading = true;
List addressList =[];
  final getStorage = GetStorage();

  //go to home
  goToHome()async{
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  getdata()async{
    addressList = AppArray().addressList;
    await Future.delayed(DurationsClass.s2);
    isLoading = false;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getdata();
    super.onReady();
  }
}