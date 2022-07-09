import 'package:fastkart/config.dart';
import 'package:fastkart/views/orderPages/orderHistory/order_history_layout/order_history_filter.dart';
import 'package:get_storage/get_storage.dart';

class OrderHistoryController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  bool isLoading = true;
  final getStorage = GetStorage();

  int selectIndex = 0;
  int filterIndex = 0;

  int itemFilterIndex = 0;

  List filterList = [];
  List orderHistory = [];

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //select category function
  selectCategory(index, id) {
    selectIndex = index;
    update();
  }

  //bottom sheet for filter
  bottomSheet() {
    BottomSheetLayout().bottomSheet(
        child: const OrderHistoryFilter());
  }


  //get data
  getData()async{
    orderHistory = AppArray().orderHistory;
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
