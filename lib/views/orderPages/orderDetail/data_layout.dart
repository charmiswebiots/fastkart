import 'package:fastkart/config.dart';

class DataLayout extends StatelessWidget {
  const DataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) => GetBuilder<OrderDetailController>(
        builder: (orderDetailCtrl) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(80)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //order id and status layout
                const OrderIdStatus(
                  orderId: 'Order ID: #5151515',
                ),
                const Space(0, 20),
                // items text layout
                OrderDetailStyle()
                    .commonTextLayout(OrderDetailFont().items,orderDetailCtrl.appCtrl.appTheme.primary),
                const  Space(0, 20),

                //item list layout
                const ItemListLayout(),

                //payment detail text layout
                OrderDetailStyle()
                    .commonTextLayout(OrderDetailFont().paymentDetails,orderDetailCtrl.appCtrl.appTheme.primary),

                // payment detail layout
                const PriceDetailLayout(isOrderDetail: false,),

                //address text layout
                OrderDetailStyle()
                    .commonTextLayout(OrderDetailFont().address,orderDetailCtrl.appCtrl.appTheme.primary),
                const Space(0, 15),

                //address layout
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailFontStyle().mulishtextLayout(
                          text: "Noah Hamilton",
                          fontSize: OrderDetailFontSize.textSizeSMedium,
                          fontWeight: FontWeight.normal,
                          color: orderDetailCtrl.appCtrl.appTheme.titleColor),
                      const Space(0, 5),
                      OrderDetailFontStyle().mulishtextLayout(
                          text: "8857 Morris Rd.,Charlottesville, VA 22901",
                          fontSize: OrderDetailFontSize.textSizeSmall,
                          fontWeight: FontWeight.normal,
                          color: orderDetailCtrl
                              .appCtrl.appTheme.darkContentColor),
                    ],
                  ),
                ),
                const Space(0, 20),
                //payment text layout
                OrderDetailStyle()
                    .commonTextLayout(OrderDetailFont().paymentMethod,orderDetailCtrl.appCtrl.appTheme.primary),

                const Space(0, 15),
                //payment method layout
               OrderDetailStyle().paymentMethodLayout(orderDetailCtrl.appCtrl.appTheme.titleColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
