import '../../../../config.dart';

class OrderIdStatus extends StatelessWidget {
  final String? orderId;
  const OrderIdStatus({Key? key,this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(10)),
          decoration: BoxDecoration(
              color:
              appCtrl.appTheme.primary,
              borderRadius: BorderRadius.circular(
                  AppScreenUtil().borderRadius(10))),
          child: Row(
            children: [
              Image.asset(
                iconAssets.box,
                height: AppScreenUtil().screenHeight(30),
              ),
              Space(10, 0),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  OrderDetailFontStyle().mulishtextLayout(
                      text: orderId,
                      fontSize:
                      OrderDetailFontSize.textSizeSmall,
                      color: appCtrl.appTheme.white),
                  Space(0, 5),
                  OrderDetailFontStyle().mulishtextLayout(
                      text: OrderDetailFont().orderDelivery,
                      letterSpacing: .5,
                      fontSize: OrderDetailFontSize
                          .textSizeMedium,
                      fontWeight: FontWeight.w700,
                      color: appCtrl.appTheme.white),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
