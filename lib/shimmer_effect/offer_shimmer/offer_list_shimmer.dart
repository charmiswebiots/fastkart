import 'package:fastkart/config.dart';
import 'package:fastkart/shimmer_effect/offer_shimmer/offer_shimmer_card.dart';

class OfferListShimmer extends StatelessWidget {
  const OfferListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) => Container(
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenHeight(15),
            right: AppScreenUtil().screenHeight(15)),
        child: ListView.builder(
          itemCount: 6,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10),),
            child: CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                borderRadius: 10,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: const OfferShimmerCard()),
          ),
        ),
      ),
    );
  }
}
