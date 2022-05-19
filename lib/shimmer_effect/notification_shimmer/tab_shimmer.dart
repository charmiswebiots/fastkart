import '../../config.dart';

class TabShimmer extends StatelessWidget {
  const TabShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().screenWidth(10)),
                tabs: <Widget>[
                  Tab(
                    child: CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray
                            .withOpacity(.5),
                        borderColor: appCtrl.appTheme.lightGray
                            .withOpacity(.5),
                        height: 12,
                        borderRadius: 2,
                        width: 80),
                  ),
                  Tab(
                    child: CommonShimmerWidget().commonShimmer(
                        color: appCtrl.appTheme.lightGray
                            .withOpacity(.5),
                        borderColor: appCtrl.appTheme.lightGray
                            .withOpacity(.5),
                        height: 12,
                        borderRadius: 2,
                        width: 80),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                  right: AppScreenUtil().screenWidth(15)),
              width: AppScreenUtil().screenWidth(150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.circle,
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  ),
                  const Space(5, 0),
                  CommonShimmerWidget().commonShimmer(
                      color:
                      appCtrl.appTheme.lightGray.withOpacity(.5),
                      borderColor:
                      appCtrl.appTheme.lightGray.withOpacity(.5),
                      height: 12,
                      borderRadius: 2,
                      width: 70),
                ],
              ),
            )
          ],
        );
      }
    );
  }
}
