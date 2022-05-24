import 'package:fastkart/config.dart';


class OfferController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List myOfferList =[];

  int itemFilterIndex = 0;

  //offer detail bottom sheet
  bottomSheet({data}) {
    BottomSheetLayout().bottomSheet(
        child: OfferDetail(
          data: data,
        ));
  }

  //bottom sheet for filter
  filterbottomSheet() {
    BottomSheetLayout().bottomSheet(
        child: GetBuilder<OfferController>(builder: (_) {
          return OfferWidget()
              .popLayout(context: Get.context!, child: const FilterLayout());
        }));
  }

  //get data
  getData(){
    appCtrl.isShimmer = true;
    appCtrl.update();
    myOfferList = AppArray().myOfferList;
    appCtrl.isShimmer = false;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }
}
