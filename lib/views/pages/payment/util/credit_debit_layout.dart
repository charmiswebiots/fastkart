import 'package:fastkart/config.dart';

class CreditDebitLayout extends StatelessWidget {
  final dynamic data;
  const CreditDebitLayout({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<PaymentController>(
          builder: (paymentCtrl) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil()
                      .screenWidth(10)),
              physics:
              const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data
                  .length,
              itemBuilder: (context, indexs) {
                return CreditDebitCard(
                  index: indexs,
                  primaryColor: paymentCtrl
                      .appCtrl.appTheme.primary,
                  selectindex:
                  paymentCtrl.walletIndex,
                  onTap: () => paymentCtrl
                      .selectCreditDebit(
                      indexs),
                  data: data[indexs],
                  titleColor: paymentCtrl
                      .appCtrl
                      .appTheme
                      .titleColor,
                );
              },
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio:
                  MediaQuery.of(context)
                      .size
                      .width /
                      (MediaQuery.of(
                          context)
                          .size
                          .height /
                          8)),
            );
          }
        );
      }
    );
  }
}
