import '../../../../config.dart';

class OrderPriceItemLayout extends StatelessWidget {
  final dynamic data;
  const OrderPriceItemLayout({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            OrderHistoryStyle().commonTextLayout(
                text: OrderHistoryFont().paid + ' ',
                color:
                appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.normal),
            InkWell(
              onTap: () => Get.toNamed(routeName.orderDetail),
              child: OrderHistoryStyle().commonTextLayout(
                  text: data['price'] + ' , ',
                  color:
                  appCtrl.appTheme.primary),
            ),
            OrderHistoryStyle().commonTextLayout(
                text: OrderHistoryFont().items + ' ',
                color:
                appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.normal),
            InkWell(
              onTap: () => Get.toNamed(routeName.orderDetail),
              child: OrderHistoryStyle().commonTextLayout(
                  text: data['qty'],
                  color:
                  appCtrl.appTheme.primary),
            ),
          ],
        );
      }
    );
  }
}
