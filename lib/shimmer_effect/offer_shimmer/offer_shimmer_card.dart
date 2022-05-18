import 'package:fastkart/config.dart';
class OfferShimmerCard extends StatelessWidget {
  const OfferShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenHeight(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      height: 20,
                      width:25),
                  const Space(10, 0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          height: 10,
                          width:8),
                      const Space(0, 5),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          height: 10,
                          width:15),
                    ],
                  ),
                  const Space(10, 0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          height: 10,
                          width:100),
                      const Space(0, 5),
                      CommonShimmerWidget().commonShimmer(
                          color: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                          borderRadius: 10,
                          height: 10,
                          width:150),
                    ],
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      height: 10,
                      width:60),
                  const Space(0, 5),
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderRadius: 10,
                      height: 10,
                      width:80),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
