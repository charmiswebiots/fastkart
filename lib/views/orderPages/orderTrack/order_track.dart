
import 'package:fastkart/shimmer_effect/order_shimmer/order_track_shimmer/order_track_shimmer.dart';

import '../../../config.dart';

class OrderTrack extends StatelessWidget {
  final orderTrackCtrl = Get.put(OrderTrackController());

  OrderTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderTrackController>(builder: (_) {
          return Directionality(
            textDirection:
            orderTrackCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: OrderTrackWidget().appBarLayout(
                isRTL: orderTrackCtrl.appCtrl.isRTL,
                context: context,
                bgColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,titleColor: orderTrackCtrl.appCtrl.appTheme.titleColor,image: orderTrackCtrl.appCtrl.isTheme
                  ? imageAssets.themeLogo
                  : imageAssets.logo,
                onTap: ()=> orderTrackCtrl.goToHome()
              ),
              backgroundColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: orderTrackCtrl.isLoading?const OrderTrackShimmer()  : Container(
                  color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                  child: Stack(
                    alignment: Alignment.bottomCenter,

                    children: [
                      Stack(
                        children: [
                          //success image layout
                          SingleChildScrollView(
                              child: OrderTrackStyle()
                                  .backgroundLayout(context: context)),
                          //order track detail
                          const OrderTrackDetail()
                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),
          );
        }),
      );
    });
  }
}
