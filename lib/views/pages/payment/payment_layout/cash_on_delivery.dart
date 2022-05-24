import '../../../../config.dart';

class CashOnDeliveryLayout extends StatelessWidget {
  const CashOnDeliveryLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          right: AppScreenUtil().screenWidth(15),
          top: AppScreenUtil().screenHeight(12.0),
        ),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.wishtListBoxColor,
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(AppScreenUtil().borderRadius(5))),
            border: Border.all(color: appCtrl.appTheme.primary)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(10),
                    vertical: AppScreenUtil().screenHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentFontStyle().nunitotextLayout(
                        text: PaymentFont().cashonDelivery,
                        fontWeight: FontWeight.w700,
                        fontSize: PaymentFontSize.textSizeSMedium,
                        color: appCtrl.appTheme.titleColor),
                  ],
                )),
            PaymentStyle().checkIcon(
                iconColor: appCtrl.appTheme.wishtListBoxColor,
                containerColor: appCtrl.appTheme.primary)
          ],
        ),
      );
    });
  }
}
