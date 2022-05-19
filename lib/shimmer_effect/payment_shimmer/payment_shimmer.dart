

import '../../config.dart';

class PaymentPageShimmer extends StatelessWidget {
  const PaymentPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Scaffold(
        body: Shimmer.fromColors(
            baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
            highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const AddNewAddressShimmer(),
                      const Space(0, 20),
                      PaymentShimmerWidget().commonCardNameWidget(
                          appCtrl.appTheme.lightGray.withOpacity(.5),
                          appCtrl.appTheme.darkGray),
                      const Space(0, 20),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PaymentShimmerWidget()
                            .cardLayout(appCtrl.appTheme.gray.withOpacity(.5),
                                appCtrl.appTheme.darkGray),
                      ),
                      const Space(0, 20),
                      PaymentShimmerWidget().commonCardNameWidget(
                          appCtrl.appTheme.lightGray.withOpacity(.5),
                          appCtrl.appTheme.darkGray),
                      Divider(
                        color: appCtrl.appTheme.darkGray,
                        thickness: 1,
                        endIndent: 15,
                        indent: 15,
                      ),
                      PaymentShimmerWidget().commonCardNameWidget(
                          appCtrl.appTheme.lightGray.withOpacity(.5),
                          appCtrl.appTheme.darkGray),
                      Divider(
                        color: appCtrl.appTheme.darkGray,
                        thickness: 1,
                        endIndent: 15,
                        indent: 15,
                      ),
                      PaymentShimmerWidget().commonCardNameWidget(
                          appCtrl.appTheme.lightGray.withOpacity(.5),
                          appCtrl.appTheme.darkGray),
                      const Space(0, 20),
                      PaymentShimmerWidget().priceDetailLayout(appCtrl.appTheme.darkGray.withOpacity(.5), context)
                    ],
                  ),
                ),
                CommonShimmerStyle().commonButton(color: appCtrl.appTheme.gray.withOpacity(.8),context: context,textColor: appCtrl.appTheme.lightGray)
              ],
            )),
      );
    });
  }
}
