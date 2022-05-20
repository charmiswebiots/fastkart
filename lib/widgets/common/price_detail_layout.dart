import '../../config.dart';

class PriceDetailLayout extends StatelessWidget {
  final bool? isOrderDetail;

  const PriceDetailLayout({Key? key, this.isOrderDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isOrderDetail!)
              MyCartFontStyle().mulishtextLayout(
                  text: MyCartFont().orderDetails,
                  color: appCtrl.appTheme.titleColor,
                  fontSize: MyCartFontSize.textSizeSMedium,
                  fontWeight: FontWeight.w600),
            const Space(0, 15),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().bagTotal,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: appCtrl.priceSymbol +  (double.parse((appCtrl.rateValue *
                    220)
                    .toStringAsFixed(2)))
                    .toString(),
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.darkContentColor),
            const Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().bagSavings,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: '-${appCtrl.priceSymbol +  (double.parse((appCtrl.rateValue *
                    20)
                    .toStringAsFixed(2)))
                    .toString()}',
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.primary),
            const Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().couponDiscount,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: MyCartFont().applyCoupon,
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.redColor),
            const Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().delivery,
                titleColor: appCtrl.appTheme.darkContentColor,
                fontWeight: FontWeight.normal,
                val: appCtrl.priceSymbol +  (double.parse((appCtrl.rateValue *
                    50)
                    .toStringAsFixed(2)))
                    .toString(),
                valColor: appCtrl.appTheme.darkContentColor),
            const Space(0, 10),
            const Divider(),
            const Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().totalAmount,
                titleColor: appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.w600,
                val: appCtrl.priceSymbol +  (double.parse((appCtrl.rateValue *
                    270)
                    .toStringAsFixed(2)))
                    .toString(),
                valColor: appCtrl.appTheme.titleColor),
          ],
        ),
      );
    });
  }
}
