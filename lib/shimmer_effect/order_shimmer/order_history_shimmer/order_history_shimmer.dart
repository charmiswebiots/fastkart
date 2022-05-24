import 'package:fastkart/shimmer_effect/order_shimmer/order_history_shimmer/order_history_list_shimmer.dart';

import '../../../config.dart';

class OrderHistoryShimmer extends StatelessWidget {
  const OrderHistoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<OrderHistoryController>(
        builder: (orderHistoryCtrl) {
          return Scaffold(
            body: Shimmer.fromColors(
                baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
                highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children:  [
                          const ShopCategoryShimmer(),
                          const Space(0, 20),
                          const CommonTextFormAndFilter(),
                          const Space(0, 20),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppScreenUtil().screenHeight(15),
                                horizontal: AppScreenUtil().screenWidth(15)),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: orderHistoryCtrl.orderHistory.length,
                              itemBuilder: (context, index) => const OrderHistoryListShimmer(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        }
      );
    });
  }
}
