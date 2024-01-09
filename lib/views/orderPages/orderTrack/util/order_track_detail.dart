import '../../../../config.dart';

class OrderTrackDetail extends StatelessWidget {
  const OrderTrackDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTrackController>(builder: (orderTrackCtrl) {
      return OrderTrackStyle().contentBGLayout(
          context: context,
          color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Space(0, 2),
                    //estimated delivery text layout
                    OrderTrackStyle().estimatedDeliveryText(
                        orderTrackCtrl.appCtrl.appTheme.darkContentColor),
                    const Space(0, 5),
                    //estimated delivery text value layout
                    OrderTrackStyle().estimatedDelivery(
                        orderTrackCtrl.appCtrl.appTheme.primary),
                    const Space(0, 5),
                    //line divider layout
                    OrderTrackStyle().dividerLayout(
                        orderTrackCtrl.appCtrl.appTheme.contentColor),
                    const Space(0, 5),

                    //user layout
                    const UserLayout(),
                    const Space(0, 5),
                    //line divider layout
                    OrderTrackStyle().dividerLayout(
                        orderTrackCtrl.appCtrl.appTheme.contentColor),
                    const Space(0, 5),

                    //address layout
                    const OrderTrackAddressLayout(),
                    const Space(0, 60),
                  ],
                ),
              ),
              //button layout
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(10)),
                child: CustomButton(
                  height: 45,
                  title: OrderTrackFont().orderDetail,
                  color: orderTrackCtrl.appCtrl.appTheme.primary,
                  fontColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                  onTap: () => Get.toNamed(routeName.orderDetail),
                ),
              ),
            ],
          ));
    });
  }
}
