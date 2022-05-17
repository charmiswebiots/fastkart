
import 'package:fastkart/config.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Shimmer.fromColors(
          baseColor: appCtrl.appTheme.gray.withOpacity(.5),
          highlightColor: appCtrl.appTheme.gray.withOpacity(.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(25)),
                child: Row(
                  children: [
                    Container(
                      color: appCtrl.appTheme.lightGray,
                      height: AppScreenUtil().screenHeight(20),
                      width: AppScreenUtil().screenWidth(20),
                    ),
                    const Space(10, 0),
                    Container(
                     decoration: BoxDecoration(
                       color: appCtrl.appTheme.lightGray,
                       borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(20))
                     ),
                      height: AppScreenUtil().screenHeight(10),
                      width: AppScreenUtil().screenWidth(150),
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }
}
