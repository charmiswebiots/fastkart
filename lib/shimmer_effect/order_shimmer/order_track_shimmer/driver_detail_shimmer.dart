import '../../../config.dart';

class DriverDetailShimmer extends StatelessWidget {
  const DriverDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 50,
                  borderRadius: 50,
                  height: 46,
                ),
                const Space(10, 0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      width: 100,
                      borderRadius: 2,
                      height: 12,
                    ),
                    const Space(0, 8),
                    CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      width: 60,
                      borderRadius: 2,
                      height: 12,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 46,
                  borderRadius: 5,
                  height: 40,child: Icon(Icons.circle,color: appCtrl.appTheme.darkGray,)
                ),
                const Space(10, 0),
                CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 46,
                  borderRadius: 5,
                  height: 40,child: Icon(Icons.circle,color: appCtrl.appTheme.darkGray,)
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
