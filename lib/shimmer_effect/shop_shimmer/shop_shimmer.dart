
import 'package:fastkart/shimmer_effect/shop_shimmer/view_cart_button.dart';

import '../../config.dart';

class ShopShimmer extends StatelessWidget {
  const ShopShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Scaffold(
        body: Shimmer.fromColors(
            baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
            highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
            child: const Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                       ShopCategoryShimmer(),
                       Space(0, 20),
                       CommonTextFormAndFilter(),
                       Space(0, 20),
                       ShopListShimmer()
                    ],
                  ),
                ),
                ViewCartButtonShimmer()
              ],
            )),
      );
    });
  }
}
