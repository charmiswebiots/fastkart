import 'package:fastkart/config.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return CommonShimmerWidget().commonShimmer(
          color: appCtrl.appTheme.lightGray.withOpacity(.5),
            height: AppScreenUtil().screenHeight(120),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
            borderRadius: 15,
          width: MediaQuery.of(context).size.width /
              AppScreenUtil().screenWidth(
                  AppScreenUtil().screenActualWidth() > 375 ? 1.6 : 1.7),
        );
      }
    );
  }
}
