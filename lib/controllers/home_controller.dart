import 'package:fastkart/config.dart';


class HomeController extends GetxController {
  List offerList = [];
  //List<BannerModel> bannerList = [];
  List bannerList = [];
  List recentBoughtList = [];
  List categoryData = [];
  List lowerPriceList = [];
  List everyDayEssentialList = [];
  List couponData = [];
  bool isLoading = false;
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

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
  getData() async {
    appCtrl.isShimmer = true;
    update();
    offerList = AppArray().offerList;
    bannerList = AppArray().bannerList;
    recentBoughtList = AppArray().recentBoughtList;
    categoryData = AppArray().categoryData;
    lowerPriceList = AppArray().lowerPriceList;
    everyDayEssentialList = AppArray().everyDayEssentialList;
    await Future.delayed(Durations.s3);
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
