import '../../../config.dart';

class OrderHistoryListShimmer extends StatelessWidget {
  const OrderHistoryListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: AppScreenUtil().screenHeight(10),
        ),
        child: CommonShimmerWidget().commonShimmer(
            color: appCtrl.appTheme.lightGray.withOpacity(.5),
            borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
            borderRadius: 10,
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.darkGray,
                                borderColor: appCtrl.appTheme.darkGray,
                                borderRadius: 2,
                                height: 10,
                                width: 150,
                              ),
                              const Space(0, 8),
                              CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.darkGray,
                                borderColor: appCtrl.appTheme.darkGray,
                                borderRadius: 2,
                                height: 10,
                                width: 120,
                              ),
                              const Space(0, 8),
                              CommonShimmerWidget().commonShimmer(
                                color: appCtrl.appTheme.darkGray,
                                borderColor: appCtrl.appTheme.darkGray,
                                borderRadius: 2,
                                height: 10,
                                width: 100,
                              )
                            ],
                          ),
                        ],
                      ),
                      CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.darkGray,
                        borderColor: appCtrl.appTheme.darkGray,
                        borderRadius: 10,
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),
                  Divider(color: appCtrl.appTheme.darkGray),
                  const Space(0, 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.darkGray,
                        borderColor: appCtrl.appTheme.darkGray,
                        borderRadius: 2,
                        height: 10,
                        width: 100,
                      ),
                      CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.darkGray,
                        borderColor: appCtrl.appTheme.darkGray,
                        borderRadius: 2,
                        height: 10,
                        width: 100,
                      )
                    ],
                  )
                ],
              ),
            )),
      );
    });
  }
}
