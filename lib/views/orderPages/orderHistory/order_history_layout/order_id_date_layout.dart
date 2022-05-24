import '../../../../config.dart';

class OrderIdDateLayout extends StatelessWidget {
  final dynamic data;
  const OrderIdDateLayout({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            OrderHistoryStyle().commonTextLayout(
                text: OrderHistoryFont().id + ' ',
                color:
                appCtrl.appTheme.titleColor),
            OrderHistoryStyle().commonTextLayout(
                text: data['orderId'] + ' , ',
                color:
                appCtrl.appTheme.titleColor),
            OrderHistoryStyle().commonTextLayout(
                text: OrderHistoryFont().dt + ' ',
                color:
                appCtrl.appTheme.titleColor),
            OrderHistoryStyle().commonTextLayout(
                text: data['date'],
                color:
                appCtrl.appTheme.titleColor),
          ],
        );
      }
    );
  }
}
