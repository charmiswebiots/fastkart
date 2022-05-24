import '../../config.dart';

class ViewCartButtonShimmer extends StatelessWidget {
  const ViewCartButtonShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: CommonShimmerWidget().commonShimmer(
              color: appCtrl.appTheme.darkContentColor.withOpacity(.8),
              borderRadius: 10,
              borderColor: appCtrl.appTheme.darkContentColor.withOpacity(.8),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.lightGray,
                            borderColor: appCtrl.appTheme.darkGray,
                            borderRadius: 2,
                            height: 8,
                            width: 80
                        ),
                        const Space(0, 8),
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.lightGray,
                            borderColor: appCtrl.appTheme.darkGray,
                            borderRadius: 2,
                            height: 8,
                            width: 60
                        )
                      ],
                    ),
                    CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.darkContentColor,
                        borderColor: appCtrl.appTheme.darkContentColor,
                        borderRadius: 2,
                        height: 8,
                        width: 80
                    ),
                  ],
                ),
              )
          ),
        );
      }
    );
  }
}
