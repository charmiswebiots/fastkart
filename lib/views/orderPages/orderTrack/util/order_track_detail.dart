import '../../../../config.dart';

class OrderTrackDetail extends StatelessWidget {
  const OrderTrackDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTrackController>(
      builder: (orderTrackCtrl) {
        return OrderTrackStyle().contentBGLayout(
            context: context,
            color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //estimated delivery text layout
                  OrderTrackStyle().estimatedDeliveryText(orderTrackCtrl.appCtrl.appTheme.darkContentColor),
                  Space(0, 5),
                  //estimated delivery text value layout
                 OrderTrackStyle().estimatedDelivery(orderTrackCtrl.appCtrl.appTheme.primary),
                  Space(0, 5),
                  //line divider layout
                  OrderTrackStyle().dividerLayout( orderTrackCtrl.appCtrl.appTheme.contentColor),
                  Space(0, 5),

                  //user layout
                  UserLayout(),
                  Space(0, 5),
                  //line divider layout
                  OrderTrackStyle().dividerLayout( orderTrackCtrl.appCtrl.appTheme.contentColor),
                  Space(0, 5),

                  //address layout
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                        AppScreenUtil().screenWidth(15)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                           AddressLayout(),
                            OrderTrackStyle().verticalLineDivider(),
                            AddressLayout(),
                            Space(0, 80)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      }
    );
  }
}
