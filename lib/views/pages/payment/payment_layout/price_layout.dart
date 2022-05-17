import 'package:fastkart/config.dart';


class PriceLayout extends StatelessWidget {
  const PriceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return PaymentStyle().priceDetailLayout(
            boxColor: appCtrl.appTheme.wishtListBoxColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentFontStyle().mulishtextLayout(
                  text: PaymentFont().orderDetails,
                  color: appCtrl.appTheme.titleColor,
                  fontSize: PaymentFontSize.textSizeMedium,
                  fontWeight: FontWeight.w600),
              const Space(0, 15),
              PaymentWidget().commonPriceDetail(
                  title: PaymentFont().bagTotal,
                  titleColor:
                  appCtrl.appTheme.darkContentColor,
                  val: PaymentFont().dollar + '220.00',
                  fontWeight: FontWeight.normal,
                  valColor:
                  appCtrl.appTheme.darkContentColor),
              const  Space(0, 10),
              PaymentWidget().commonPriceDetail(
                  title: PaymentFont().bagSavings,
                  titleColor:
                  appCtrl.appTheme.darkContentColor,
                  val: '-${PaymentFont().dollar}20.00',
                  fontWeight: FontWeight.normal,
                  valColor: appCtrl.appTheme.primary),
              const Space(0, 10),
              PaymentWidget().commonPriceDetail(
                  title: PaymentFont().couponDiscount,
                  titleColor:
                  appCtrl.appTheme.darkContentColor,
                  val: PaymentFont().addCard,
                  fontWeight: FontWeight.normal,
                  valColor: appCtrl.appTheme.redColor),
              const Space(0, 10),
              PaymentWidget().commonPriceDetail(
                  title: PaymentFont().delivery,
                  titleColor:
                  appCtrl.appTheme.darkContentColor,
                  fontWeight: FontWeight.normal,
                  val: PaymentFont().dollar + '50.00',
                  valColor:
                  appCtrl.appTheme.darkContentColor),
              const Space(0, 10),
              const Divider(),
              const  Space(0, 10),
              PaymentWidget().commonPriceDetail(
                  title: PaymentFont().totalAmount,
                  titleColor: appCtrl.appTheme.titleColor,
                  fontWeight: FontWeight.w600,
                  val: PaymentFont().dollar + '270.00',
                  valColor: appCtrl.appTheme.titleColor),
            ],
          )
        );
      }
    );
  }
}
