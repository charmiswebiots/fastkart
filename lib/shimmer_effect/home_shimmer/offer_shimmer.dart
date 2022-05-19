import 'package:fastkart/shimmer_effect/home_shimmer/card_shimmer.dart';

import '../../config.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 50 / 100,
        child: ListView.builder(
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
            child: CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                height: 100,
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                child: const CardShimmer()),
          ),
        ),
      );
    });
  }
}
