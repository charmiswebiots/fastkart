
import 'package:fastkart/config.dart';
import 'package:get_storage/get_storage.dart';

class AddAddressController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
bool isLoading = true;
  List addressList =[];
  final getStorage = GetStorage();

  //go to Search
  goToSearch()async{
    Get.back();
    await getStorage.write('selectedIndex', 2);
    appCtrl.selectedIndex = 2;
    update();
  }

  //get data
  getData()async{
    isLoading = true;
    update();
    addressList = AppArray().addressList;
    update();
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