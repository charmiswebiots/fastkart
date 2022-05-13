import '../../../../config.dart';

class OrderHistoryFilter extends StatelessWidget {
  const OrderHistoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
          ),
          height: MediaQuery.of(context).size.height / 1.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderHistoryStyle()
                  .filterText(orderHistoryCtrl.appCtrl.appTheme.titleColor),
              Space(0, 20),

              //filter list
              const FilterList(),

              Space(0, 30),

              OrderHistoryStyle()
                  .timeFilterText(orderHistoryCtrl.appCtrl.appTheme.titleColor),
              Space(0, 20),

              //time filter list
              const TimeFilterList(),
              Space(0, 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonPopUpButton(
                      onTap: () => Get.back(),
                      containerColor:
                          orderHistoryCtrl.appCtrl.appTheme.popUpColor,
                      borderColor: orderHistoryCtrl.appCtrl.appTheme.primary,
                      textColor: orderHistoryCtrl.appCtrl.appTheme.primary,
                      text: OfferFont().close),
                  CommonPopUpButton(
                      onTap: () => Get.back(),
                      containerColor: orderHistoryCtrl.appCtrl.appTheme.primary,
                      borderColor: orderHistoryCtrl.appCtrl.appTheme.primary,
                      textColor: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
                      text: OfferFont().apply),
                ],
              )
            ],
          ));
    });
  }
}
