import '../../../config.dart';

class OrderSummaryShimmer extends StatelessWidget {
  const OrderSummaryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Scaffold(
        body: Shimmer.fromColors(
            baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
            highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonShimmerWidget().commonShimmer(
                              color: appCtrl.appTheme.lightGray.withOpacity(.5),
                              borderColor:
                                  appCtrl.appTheme.lightGray.withOpacity(.5),
                              width: MediaQuery.of(context).size.width,
                              borderRadius: 10,
                              height: 50,
                            ),
                            const Space(0, 20),
                            CommonShimmerWidget().commonShimmer(
                              color: appCtrl.appTheme.lightGray.withOpacity(.5),
                              borderColor:
                                  appCtrl.appTheme.lightGray.withOpacity(.5),
                              width: 100,
                              borderRadius: 2,
                              height: 10,
                            ),
                            const Space(0, 20),
                            const OrderSummaryList(),
                            const Space(0, 10),
                            CommonShimmerWidget().commonShimmer(
                              color: appCtrl.appTheme.lightGray.withOpacity(.5),
                              borderColor:
                                  appCtrl.appTheme.lightGray.withOpacity(.5),
                              width: 100,
                              borderRadius: 2,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const Space(0, 20),
                      const PriceDetailShimmer(),
                      const Space(0, 10),
                      const OrderSummaryAddress(
                        isShow: true,
                      ),
                      const Space(0, 20),
                      const OrderSummaryAddress(
                        isShow: false,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}
