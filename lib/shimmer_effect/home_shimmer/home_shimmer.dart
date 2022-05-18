import 'package:fastkart/config.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

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
                CommonShimmerWidget().commonFullWidthShimmer(
                    context: context,
                    color: appCtrl.appTheme.lightGray.withOpacity(.4),
                    height: 150),
                const Space(0, 20),
                CommonShimmerWidget().commonFullWidthShimmer(
                    context: context,
                    color: appCtrl.appTheme.lightGray.withOpacity(.4),
                    height: 100,
                    child: const SquareListShimmer()),
                const Space(0, 20),
                CommonShimmerStyle().shopCategory(color:appCtrl.appTheme.lightGray.withOpacity(.4) ),
                const Space(0, 20),
                const CategoryShimmer(),
                const VerticalListShimmer(),
                const Space(0, 20),
                const CommonHorizontalShimmer(),
                const Space(0, 20),
                const CommonHorizontalShimmer(),
                const Space(0, 20),
                const CouponShimmer(),
                const Space(0, 20),
                const CommonHorizontalShimmer(),
                const Space(0, 20),
                CommonShimmerStyle().notFindAndBrowseCategory(appCtrl.appTheme.lightGray.withOpacity(.5),appCtrl.appTheme.gray.withOpacity(.2)),
                const Space(0, 50),
              ],
            ),
          ));
    });
  }
}
