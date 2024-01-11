import 'package:fastkart/shimmer_effect/category_shimmer/banner_shimmer.dart';
import 'package:fastkart/shimmer_effect/category_shimmer/category_vertical_list_shimmer.dart';
import 'package:fastkart/shimmer_effect/category_shimmer/sub_category_list_shimmer.dart';

import '../../config.dart';

class CategoryListShimmer extends StatelessWidget {
  const CategoryListShimmer({Key? key}) : super(key: key);

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
                CommonShimmerWidget().commonFullWidthShimmer(
                    context: context,
                    color: appCtrl.appTheme.lightGray.withOpacity(.4),
                    height: 45),
                const Space(0, 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  const  CategoryVerticalListShimmer(),
                    const Space(10, 0),
                    Padding(
                      padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(15)),
                      child: const Column(
                        children:  [
                          BannerShimmer(),
                          Space(0, 10),
                          GridViewShimmer()
                        ],
                      ),
                    )
                  ],
                )

              ],
            ),
          ));
    });
  }
}
