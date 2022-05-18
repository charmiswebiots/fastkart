import 'package:fastkart/shimmer_effect/offer_shimmer/offer_list_shimmer.dart';

import '../../config.dart';

class OfferPageShimmer extends StatelessWidget {
  const OfferPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
          highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.4),
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.4),
                          width: 250,
                          borderRadius: 10,
                          height: 45),
                      const Space(10, 0),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          borderColor:
                              appCtrl.appTheme.lightGray.withOpacity(.5),
                          height: 10,
                          width: 70),

                    ],
                  ),
                ),
                const Space(0, 20),
                const OfferListShimmer()
              ],
            ),
          ));
    });
  }
}
