import 'package:fastkart/config.dart';
import 'package:fastkart/shimmer_effect/home_shimmer/horizontal_list_shimmer.dart';

class CommonHorizontalShimmer extends StatelessWidget {
  const CommonHorizontalShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Column(
          children: [
            CommonShimmerWidget().commonTextAndSellAll(
                appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0, 15),
            SizedBox(
              height: AppScreenUtil().screenHeight(170),
              child: ListView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: AppScreenUtil().screenWidth(10)),
                        child: CommonShimmerWidget().commonShimmer(
                            borderColor:
                                appCtrl.appTheme.lightGray.withOpacity(.5),
                            color: appCtrl.appTheme.gray.withOpacity(.2),
                            height: 160,
                            width: 130,
                            borderRadius: 10,
                            child: const HomeHorizontalListShimmer()),
                      )),
            )
          ],
        ),
      );
    });
  }
}
