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
  commonBottomSheet({context, index}) {
    showModalBottomSheet<void>(
      backgroundColor: appCtrl.appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GetBuilder<ProductDetailController>(builder: (_) {
          return index == 0
              ? QuantityBottomSheet(
                  data: AppArray().quantityList,
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
        });
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    detailList = AppArray().detailList;
    reviewList = AppArray().reviewList;
    detail = AppArray().productDetailList;
    update();
    print('detailList : $detailList');
  }
}
