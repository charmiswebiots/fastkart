import 'package:fastkart/config.dart';

class SearchController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List offerList = [];

  //quantity increment function
  plusTap(index){
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index){
    if (offerList[index]['quantity'] != 0) {
      if(offerList[index]['quantity'] == "0"){
        offerList[index]['quantity'] = "0";
        update();
      }else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    offerList = AppArray().offerList;
    update();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    offerList = AppArray().offerList;
    update();
    super.onReady();
  }
}