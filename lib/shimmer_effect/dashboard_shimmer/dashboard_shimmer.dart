
import 'package:fastkart/config.dart';
import 'package:fastkart/shimmer_effect/dashboard_shimmer/dashboard_shimmer_widget.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return  Shimmer.fromColors(
        baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
        highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
        child: Padding(
          padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(15),right: AppScreenUtil().screenWidth(15),top: AppScreenUtil().screenHeight(35),bottom: AppScreenUtil().screenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  DashboardShimmerWidget().iconShimmer(Icons.square,appCtrl.appTheme.lightGray.withOpacity(.4)),
                 const Space(10,0),
                  DashboardShimmerWidget().textShimmer(color:appCtrl.appTheme.lightGray.withOpacity(.4),width: 100,height: 10),
                ],
              ),
              Row(
                children: [
                  DashboardShimmerWidget().iconShimmer(Icons.square,appCtrl.appTheme.lightGray.withOpacity(.4)),
                  const Space(5,0),
                  DashboardShimmerWidget().textShimmer(color:appCtrl.appTheme.lightGray.withOpacity(.4),width: 80,height: 10),
                  const Space(5,0),
                  DashboardShimmerWidget().iconShimmer(Icons.circle,appCtrl.appTheme.lightGray.withOpacity(.4)),
                ],
              )

            ],
          ),
        ),
      );
    });
  }
}
