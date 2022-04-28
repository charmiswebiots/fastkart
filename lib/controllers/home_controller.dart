import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';

class HomeController extends GetxController {
  List offerList = [];

//quantity increment function
  plusTap(index) {
    print(offerList[index]['quantity']);
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['qty'] != 0) {
      int count = int.parse(offerList[index]['quantity'].toString());
      count = count - 1;
      offerList[index]['quantity'] = count.toString();
      update();
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
