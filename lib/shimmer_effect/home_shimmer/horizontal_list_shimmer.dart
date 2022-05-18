import 'package:fastkart/config.dart';

class HomeHorizontalListShimmer extends StatelessWidget {
  const HomeHorizontalListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(10),
              horizontal: AppScreenUtil().screenWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CommonShimmerWidget().commonShimmer(
                    color:
                    appCtrl.appTheme.darkContentColor,
                    height: 50,
                    borderColor:
                    appCtrl.appTheme.darkContentColor,
                    width: 70,
                    borderRadius: 10),
              ),
              const Space(0, 20),
              CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.darkContentColor,
                  height: 8,
                  borderColor:
                  appCtrl.appTheme.darkContentColor,
                  width: 80,
                  borderRadius: 10),
              const Space(0, 8),
              CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.darkContentColor,
                  height: 8,
                  borderColor:
                  appCtrl.appTheme.darkContentColor,
                  width: 60,
                  borderRadius: 10),
              const Space(0, 8),
              CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.darkContentColor,
                  height: 8,
                  borderColor:
                  appCtrl.appTheme.darkContentColor,
                  width: 40,
                  borderRadius: 10),
              const Space(0, 8),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  CommonShimmerWidget().commonShimmer(
                      color:
                      appCtrl.appTheme.darkContentColor,
                      height: 8,
                      borderColor:
                      appCtrl.appTheme.darkContentColor,
                      width: 50,
                      borderRadius: 10),
                  CommonShimmerWidget().commonShimmer(
                      color:
                      appCtrl.appTheme.darkContentColor,
                      height: 30,
                      borderColor:
                      appCtrl.appTheme.darkContentColor,
                      width: 30,
                      borderRadius: 10),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
