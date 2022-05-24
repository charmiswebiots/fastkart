import 'package:fastkart/shimmer_effect/order_shimmer/order_track_shimmer/order_track_detail_shimmer.dart';

import '../../../config.dart';

class OrderTrackShimmer extends StatelessWidget {
  const OrderTrackShimmer({Key? key}) : super(key: key);

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
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 0,
                      height: MediaQuery.of(context).size.height,
                    ),
                    const OrderTrackDetailShimmer()
                  ],
                ),
              ],
            )),
      );
    });
  }
}
