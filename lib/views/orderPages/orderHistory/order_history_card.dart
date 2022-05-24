import '../../../config.dart';

class OrderHistoryCard extends StatelessWidget {
  final int? index;
  final int? selectedIndex;
  final dynamic data;

  const OrderHistoryCard({
    Key? key,
    this.index,
    this.selectedIndex,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return InkWell(
          onTap: () => Get.toNamed(routeName.addressList),
          child: Container(
              margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(15),
                  horizontal: AppScreenUtil().screenWidth(10)),
              decoration: BoxDecoration(
                  color: orderHistoryCtrl.appCtrl.appTheme.wishtListBoxColor,
                  border: Border.all(
                      color: selectedIndex == index
                          ? orderHistoryCtrl.appCtrl.appTheme.primary
                          : orderHistoryCtrl.appCtrl.appTheme.wishtListBoxColor,
                      width: 1.5),
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(10))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderIdDateLayout(data: data),
                          const Space(0, 8),
                          OrderHistoryStyle().commonTextLayout(
                              text: data['address'],
                              color: orderHistoryCtrl
                                  .appCtrl.appTheme.darkContentColor,
                              fontWeight: FontWeight.normal),
                          const Space(0, 8),
                          OrderPriceItemLayout(data: data),
                        ],
                      ),
                      OrderHistoryWidget().mapImage()
                    ],
                  ),
                  const Space(0, 5),
                  Divider(
                      color: orderHistoryCtrl.appCtrl.appTheme.contentColor),
                  const Space(0, 5),
                  OrderAgainRatingLayout(
                    data: data,
                    index: index,
                  )
                ],
              )));
    });
  }
}
