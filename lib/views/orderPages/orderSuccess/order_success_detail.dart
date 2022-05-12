import 'package:fastkart/config.dart';


class OrderSuccessDetail extends StatelessWidget {
  const OrderSuccessDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<OrderSuccessController>(builder: (orderSuccessCtrl) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(20),
                vertical: AppScreenUtil().screenWidth(20)),
            child: Column(
              children: [
                //success image layout
                Image.asset(imageAssets.success),
                Space(0, 20),
                //thankyou text layout
                OrderSuccessStyle()
                    .thankYouText(orderSuccessCtrl.appCtrl.appTheme.titleColor),
                Space(0, 10),

                //description layout
                OrderSuccessStyle().descriptionText(
                    orderSuccessCtrl.appCtrl.appTheme.darkContentColor),
                Space(0, 5),
                Divider(
                  color: orderSuccessCtrl.appCtrl.appTheme.contentColor,
                ),
                Space(0, 5),
                //order date and id layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderDateAndId(
                        image: iconAssets.calendar,
                        title: OrderSuccessFont().orderDate,
                        val: "Sun, 14 Apr, 19:12"),
                    OrderDateAndId(
                        image: iconAssets.paper,
                        title: OrderSuccessFont().orderId,
                        val: "#548475151"),
                  ],
                ),

                //price detail
                PriceDetailColorLayout()
              ],
            ),
          ),
        );
      });
    });
  }
}
