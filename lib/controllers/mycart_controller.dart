import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/offers/util/offer_detail.dart';
import 'package:get_storage/get_storage.dart';

class MyCartListController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final getStorage = GetStorage();
  List offerList = [];
  bool isAppBar = false;

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //leading tap
  leadingTap() async {
    print('tap');
    if (isAppBar) {
      Get.back();
    } else {
      await appCtrl.getStorage.write('selectedIndex', 0);
      appCtrl.selectedIndex = 0;
      appCtrl.update();
    }
  }

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
    if (offerList[index]['quantity'] != 0) {
      print(offerList[index]['quantity']);
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

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

//get data
  getData() {
    print(Get.arguments);
    offerList = AppArray().offerList;
    update();
    appCtrl.hideLoading();
    update();
  }

  //offer detail bottom sheet
  bottomSheet(
      {data, context}) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return OfferDetail(
          data: data,
        );
      },
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.showLoading();
    appCtrl.update();
    getData();
    super.onReady();
  }
}
