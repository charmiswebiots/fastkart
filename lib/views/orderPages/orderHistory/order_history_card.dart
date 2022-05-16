import '../../../config.dart';

class OrderHistoryCard extends StatelessWidget {
  final int? index;
  final int? selectedIndex;
  final dynamic data;
  const OrderHistoryCard(
      {Key? key,
      this.index,
      this.selectedIndex,
      this.data,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (orderHistoryCtrl) {
      return InkWell(
        onTap: () => Get.toNamed(routeName.addressList),
        child: Container(
          margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(15),
              horizontal: AppScreenUtil().screenWidth(15)),
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
                      Row(
                        children: [
                          OrderHistoryStyle().commonTextLayout(
                              text: OrderHistoryFont().id,
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor),
                          OrderHistoryStyle().commonTextLayout(
                              text: data['orderId'] + ' , ',
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor),
                          OrderHistoryStyle().commonTextLayout(
                              text: OrderHistoryFont().dt,
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor),
                          OrderHistoryStyle().commonTextLayout(
                              text: data['date'],
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor),
                        ],
                      ),
                      const Space(0, 8),
                      OrderHistoryStyle().commonTextLayout(
                          text: data['address'],
                          color: orderHistoryCtrl
                              .appCtrl.appTheme.darkContentColor,
                          fontWeight: FontWeight.normal),
                      const Space(0, 8),
                      Row(
                        children: [
                          OrderHistoryStyle().commonTextLayout(
                              text: OrderHistoryFont().paid,
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor,
                              fontWeight: FontWeight.normal),
                          InkWell(
                            onTap:  () =>
                                Get.toNamed(routeName.orderDetail),
                            child: OrderHistoryStyle().commonTextLayout(
                                text: data['price'] + ' , ',
                                color:
                                    orderHistoryCtrl.appCtrl.appTheme.primary),
                          ),
                          OrderHistoryStyle().commonTextLayout(
                              text: OrderHistoryFont().items,
                              color:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor,
                              fontWeight: FontWeight.normal),
                          InkWell(
                            onTap:  () =>
                                Get.toNamed(routeName.orderDetail),
                            child: OrderHistoryStyle().commonTextLayout(
                                text: data['qty'],
                                color:
                                    orderHistoryCtrl.appCtrl.appTheme.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    iconAssets.map1,
                    height: AppScreenUtil().screenHeight(70),
                  )
                ],
              ),
              const Space(0, 5),
              Divider(
                color: orderHistoryCtrl.appCtrl.appTheme.contentColor,
              ),
              const Space(0, 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Get.toNamed(routeName.addressList),
                      child: OrderHistoryStyle().commonTextLayout(
                          text: OrderHistoryFont().orderAgain,
                          color: orderHistoryCtrl.appCtrl.appTheme.titleColor,
                          fontWeight: FontWeight.w700)),
                  index == 0
                      ? InkWell(
                      onTap: () => Get.toNamed(routeName.addressList),
                          child: OrderHistoryStyle().commonTextLayout(
                              text: OrderHistoryFont().rateReviewProduct,
                              color: orderHistoryCtrl
                                  .appCtrl.appTheme.darkContentColor,
                              fontWeight: FontWeight.normal))
                      : CommonRatingLayout(
                          value: double.parse(data['rating'].toString()),
                          onRatingUpdate: (rating) {}),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
