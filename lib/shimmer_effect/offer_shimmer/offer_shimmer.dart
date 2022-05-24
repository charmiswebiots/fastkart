
import '../../config.dart';

class OfferPageShimmer extends StatelessWidget {
  const OfferPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
          highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                CommonTextFormAndFilter(),
                 Space(0, 20),
                 OfferListShimmer()
              ],
            ),
          ));
    });
  }
}
