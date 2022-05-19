import '../../../config.dart';

class OrderTrackDetailShimmer extends StatelessWidget {
  const OrderTrackDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.lightGray.withOpacity(.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 120,
                  borderRadius: 2,
                  height: 12,
                ),
                const Space(0, 10),
                CommonShimmerWidget().commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 150,
                  borderRadius: 2,
                  height: 12,
                ),
                const Space(0, 10),
                Divider(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  thickness: 2,
                  endIndent: 15,
                  indent: 15,
                ),
                const Space(0, 10),
                const DriverDetailShimmer(),
                const Space(0, 10),
                Divider(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  thickness: 2,
                  endIndent: 15,
                  indent: 15,
                ),
                const Space(0, 10),
                const OrderTrackAddressShimmer()
              ],
            ),
            CommonShimmerStyle().commonButton(context: context,color: appCtrl.appTheme.darkGray.withOpacity(.5),textColor: appCtrl.appTheme.gray)
          ],
        ),
      );
    });
  }
}
