import '../../config.dart';

class NotificationListShimmer extends StatelessWidget {
  const NotificationListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: AppScreenUtil().screenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.4),
                      borderColor:
                      appCtrl.appTheme.lightGray.withOpacity(.4),
                      borderRadius: 5,
                      height: 45,
                      width: 48,
                      child: Icon(
                        Icons.circle,
                        color: appCtrl.appTheme.darkGray,
                      )),
                  const Space(10, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray.withOpacity(.4),
                        borderColor:
                        appCtrl.appTheme.lightGray.withOpacity(.4),
                        borderRadius: 2,
                        height: 10,
                        width: 100,),
                      const Space(0, 10),
                      CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray.withOpacity(.4),
                        borderColor:
                        appCtrl.appTheme.lightGray.withOpacity(.4),
                        borderRadius: 2,
                        height: 10,
                        width: 60,),
                    ],
                  )
                ],
              ),
              CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.lightGray.withOpacity(.4),
                borderColor:
                appCtrl.appTheme.lightGray.withOpacity(.4),
                borderRadius: 5,
                height: 25,
                width: 60,
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(8)),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.darkGray,
                      borderColor:
                      appCtrl.appTheme.darkGray,
                      borderRadius: 2,
                      height: 10,
                      width: 40),
                ),)
            ],
          ),
        );
      }
    );
  }
}
