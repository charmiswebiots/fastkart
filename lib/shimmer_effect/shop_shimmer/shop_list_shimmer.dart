import 'package:fastkart/shimmer_effect/home_shimmer/card_shimmer.dart';

import '../../config.dart';

class ShopListShimmer extends StatelessWidget {
  const ShopListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<ShopController>(builder: (shopCtrl) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: shopCtrl.offerList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
                  child: index == 3
                      ? GetBuilder<AppController>(builder: (appCtrl) {
                          return CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.lightGray.withOpacity(.5),
                            height: 100,
                            borderColor:
                                appCtrl.appTheme.lightGray.withOpacity(.5),
                            width: MediaQuery.of(context).size.width,
                            borderRadius: 0,
                          );
                        })
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(15)),
                          child: CommonShimmerWidget().commonShimmer(
                              color: appCtrl.appTheme.lightGray.withOpacity(.5),
                              height: 100,
                              borderColor:
                                  appCtrl.appTheme.lightGray.withOpacity(.5),
                              width: MediaQuery.of(context).size.width,
                              borderRadius: 10,
                              child: const CardShimmer()),
                        ),
                );
              }),
        );
      });
    });
  }
}
