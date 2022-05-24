import 'package:fastkart/config.dart';

class PriceDetailShimmer extends StatelessWidget {
  const PriceDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.5),
                borderRadius: 2,
                borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                width: 80,
                height: 10),
            const Space(0,15),
            CommonShimmerWidget().commonRowShimmer(appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0,15),
            CommonShimmerWidget().commonRowShimmer(appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0,15),
            CommonShimmerWidget().commonRowShimmer(appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0,15),
            CommonShimmerWidget().commonRowShimmer(appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0,10),
            Divider(
              color: appCtrl.appTheme.lightGray.withOpacity(.5),
            ),
            const Space(0,10),
            CommonShimmerWidget().commonRowShimmer(appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0,15),
          ],
        ),
      );
    });
  }
}
