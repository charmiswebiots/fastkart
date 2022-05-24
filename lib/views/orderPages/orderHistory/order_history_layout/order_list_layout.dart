import '../../../../config.dart';

class OrderListLayout extends StatelessWidget {
  const OrderListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<OrderHistoryController>(
      builder: (orderHistoryCtrl) {
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(15),
              horizontal: AppScreenUtil().screenWidth(15)),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderHistoryCtrl.orderHistory.length,
            itemBuilder: (context, index) {
              return OrderHistoryCard(
                data: orderHistoryCtrl.orderHistory[index],
                index: index,
              );
            },
          ),
        );
      }
    );
  }
}
