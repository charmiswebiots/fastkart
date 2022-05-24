import 'package:fastkart/config.dart';

class CouponShimmer extends StatelessWidget {
  const CouponShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        height: MediaQuery.of(context).size.height * 30 / 100,
        color: appCtrl.appTheme.gray.withOpacity(.7),
        child: Column(
          children: [
            CommonShimmerWidget().commonTextAndSellAll(
                appCtrl.appTheme.lightGray.withOpacity(.5)),
            const Space(0, 15),
            SizedBox(
              height: AppScreenUtil().screenHeight(120),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
                  child: CommonShimmerWidget().commonShimmer(
                      color: appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                      height: 120,
                      width: 150,
                      borderRadius: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(12),vertical: AppScreenUtil().screenHeight(10)),
                        child: Column(
                          children: [
                            CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.lightGray,
                                borderColor:
                                    appCtrl.appTheme.lightGray,
                                height: 30,
                                width: 150,
                                borderRadius: 10),
                            const Space(0, 10),
                            Divider(
                              thickness: 2,
                              color: appCtrl.appTheme.lightGray,
                            ),
                            const Space(0, 10),
                            CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.lightGray,
                                borderColor:
                                appCtrl.appTheme.lightGray,
                                height: 8,
                                width: 100,
                                borderRadius: 10),
                            const Space(0, 10),
                            CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.lightGray,
                                borderColor:
                                appCtrl.appTheme.lightGray,
                                height: 8,
                                width: 200,
                                borderRadius: 10),
                          ],
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
