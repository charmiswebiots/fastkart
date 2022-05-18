import 'package:fastkart/config.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonShimmerWidget().commonShimmer(
                color: appCtrl.appTheme.darkGray,
                height: 40,
                width: 40,
                borderColor: appCtrl.appTheme.darkGray,
                borderRadius: 10),
            const Space(20, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.darkGray,
                    height: 8,
                    width: 100,
                    borderColor: appCtrl.appTheme.darkGray,
                    borderRadius: 10),
                const Space(0, 10),
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.darkGray,
                    height: 10,
                    width: 50,
                    borderColor: appCtrl.appTheme.darkGray,
                    borderRadius: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.darkGray,
                            height: 10,
                            width: 40,
                            borderColor: appCtrl.appTheme.darkGray,
                            borderRadius: 10),
                        const Space(10, 0),
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.darkGray,
                            height: 20,
                            borderColor: appCtrl.appTheme.darkGray,
                            width: 60,
                            borderRadius: 20),
                        const Space(40, 0),
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.darkGray,
                            height: 30,
                            borderColor: appCtrl.appTheme.darkGray,
                            width: 80,
                            borderRadius: 10)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
