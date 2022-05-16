import '../../../config.dart';

class PaymentScreen extends StatelessWidget {
  final paymentCtrl = Get.put(PaymentController());

  PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<PaymentController>(builder: (_) {
          return Scaffold(
            appBar: PaymentWidget().appBarLayout(
                paymentBgColor: paymentCtrl.appCtrl.appTheme.paymentBgColor,
                titleColor: paymentCtrl.appCtrl.appTheme.titleColor,
                isTheme: paymentCtrl.appCtrl.isTheme),
            backgroundColor: paymentCtrl.appCtrl.appTheme.paymentBgColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Container(
                color: paymentCtrl.appCtrl.appTheme.paymentBgColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //payment card list layout
                    const PaymentDetailLayout(),

                    //confirm payment layout
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: CustomButton(
                        height: 40,
                        title: PaymentFont().confirmPayment,
                        color: paymentCtrl.appCtrl.appTheme.primary,
                        fontColor: paymentCtrl.appCtrl.appTheme.whiteColor,
                        onTap: () => Get.toNamed(routeName.orderSuccess),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
