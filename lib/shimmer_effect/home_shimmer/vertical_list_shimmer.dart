import 'package:fastkart/config.dart';
import 'package:fastkart/shimmer_effect/home_shimmer/offer_shimmer.dart';

class VerticalListShimmer extends StatelessWidget {
  const VerticalListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        height: MediaQuery.of(context).size.height * 60 / 100,
        color: appCtrl.appTheme.gray.withOpacity(.7),
        child: Column(
          children: [
            CommonShimmerWidget().commonTextAndSellAll(
                appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0, 15),
              const OfferShimmer(),

          ],
        ),
      );
    });
  }
}
