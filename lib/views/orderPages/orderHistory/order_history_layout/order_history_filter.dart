import '../../../../config.dart';

class OrderHistoryFilter extends StatelessWidget {
  const OrderHistoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return  Directionality(
        textDirection:
        orderHistoryCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
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
                const Space(0, 20),

                //filter list
                const FilterList(),

                const Space(0, 30),

                OrderHistoryStyle()
                    .timeFilterText(orderHistoryCtrl.appCtrl.appTheme.titleColor),
                const Space(0, 20),

                //time filter list
                const TimeFilterList(),
                const Space(0, 20),

                CommonCancelCloseApplyButton(
                  button1: OfferFont().close,
                  button2: ShopFont().cancel,
                )
              ],
            )),
      );
    });
  }
}
