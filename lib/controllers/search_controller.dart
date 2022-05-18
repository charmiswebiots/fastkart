import 'package:fastkart/config.dart';

class SearchController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List offerList = [];
  List recentSearch = [];
  List categoryData = [];

  //quantity increment function
  plusTap(index) {
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['quantity'] != 0) {
      if (offerList[index]['quantity'] == "0") {
        offerList[index]['quantity'] = "0";
        update();
      } else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

  //get data
  getData() {
    appCtrl.isShimmer = true;
    appCtrl.update();
    offerList = AppArray().offerList;
    recentSearch = AppArray().recentSearch;
    categoryData = AppArray().categoryData;
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }
}
