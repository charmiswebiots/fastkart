import 'package:fastkart/config.dart';

class ProductDetailController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int quantityIndex = 0;
  int quantity = 0;
  bool expand = false;
  int? tapped = 0;
  List detailList = [];
  List reviewList = [];
  List detail = [];
  List quantityList = [];
  int deliveryIndex = 0;
  double rating = 2.5;
  bool isShow = false;
  String selectedQuantity = AppArray().quantityList[0]['title'].toString();
  String selectedDeliveryTime =
      AppArray().deliveryTimeList[0]['title'].toString();

  //increase quantity
  increaseQuantity() {
    quantity++;
    update();
  }

  //decrease quantity
  decreaseQuantity() {
    if (quantity != 0) {
      quantity--;
      update();
    } else {
      quantity = 0;
      update();
    }
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  //common select bottom sheet
  commonBottomSheet({index}) {
    BottomSheetLayout().bottomSheet(
        child: GetBuilder<ProductDetailController>(builder: (_) {
      return index == 0
          ? QuantityBottomSheet(
              data: quantityList,
              closeTap: () => Get.back(),
              applyTap: () => Get.back(),
              isQuantity: true,
            )
          : index == 1
              ? QuantityBottomSheet(
                  data: AppArray().deliveryTimeList,
                  closeTap: () => Get.back(),
                  applyTap: () => Get.back(),
                  isQuantity: false,
                )
              : AllReviewLayout(
                  reviewList: reviewList,
                );
    }));
  }

  //get data
  getData() {
    detailList = AppArray().detailList;
    reviewList = AppArray().reviewList;
    detail = AppArray().productDetailList;
    quantityList = AppArray().quantityList;
    //split the value
    selectedQuantity = quantityList[0]['title'].substring(0, 7) +
        ' ' +
        appCtrl.commonController.priceSymbol +
        (double.parse((appCtrl.commonController.rateValue *
                    double.parse(
                        quantityList[0]['title'].toString().substring(8)))
                .toStringAsFixed(2)))
            .toString();

    update();
    for (var i = 0; i < quantityList.length; i++) {
      String text = quantityList[i]['title'].toString();
      int? sub = text.indexOf('\$');
      quantityList[i]['title'] = quantityList[i]['title'].substring(0, sub) +
          ' ' +
          appCtrl.commonController.priceSymbol +
          (double.parse(
                  (appCtrl.commonController.rateValue * double.parse(text.substring(sub + 1)))
                      .toStringAsFixed(2)))
              .toString();
    }

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
