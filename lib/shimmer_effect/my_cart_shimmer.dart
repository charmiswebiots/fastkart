import 'package:fastkart/config.dart';


class MyCartShimmer extends StatelessWidget {
  final bool? isAppBar;

  const MyCartShimmer({Key? key, this.isAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) => Shimmer.fromColors(
        baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
        highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .1 / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonAppBarShimmer(),
                    const Space(0, 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                      child: const OfferShimmer(),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                      child: CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: const OfferShimmerCard()),
                    ),
                    const Space(0, 20),
                    const PriceDetailShimmer()
                  ],
                ),
              ),
            ),
           CommonShimmerStyle().commonButton(context: context,color: appCtrl.appTheme.lightGray.withOpacity(.9),textColor: appCtrl.appTheme.darkContentColor),
          ],
        ),
      ),
    );
  }
}
