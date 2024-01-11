import 'package:fastkart/config.dart';

class MyWishListController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List offerList = [];
  bool isLoading =true;

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

  getData()async{
    offerList = AppArray().offerList;
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