
import '../../config.dart';

class SearchPageShimmer extends StatelessWidget {
  const SearchPageShimmer({Key? key}) : super(key: key);

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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      height: 10,
                      width: 100),
                ),
                const Space(0, 20),
                const TitleHorizontalList(),
                const Space(0, 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      height: 10,
                      width: 100),
                ),
                const Space(0, 20),
                const ImageHorizontalList(),
                const Space(0, 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      height: 10,
                      width: 100),

                ),
                const Space(0, 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15),
                      vertical: AppScreenUtil().screenHeight(10)),
                  height: MediaQuery.of(context).size.height * 60 / 100,
                  color: appCtrl.appTheme.gray.withOpacity(.7),
                  child: const OfferShimmer(),
                ),
                const Space(0, 50),
              ],
            ),
          ));
    });
  }
}
