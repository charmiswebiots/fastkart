import '../../../../config.dart';

class OfferDetail extends StatelessWidget {
  final dynamic data;

  const OfferDetail({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Directionality(
        textDirection: appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
            ),
            height: AppScreenUtil().screenHeight(480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferDetailContent(
                  data: data,
                ),
                const Space(0, 10),
                OfferStyle()
                    .termsAndCondition(appCtrl.appTheme.darkContentColor),
                const Space(0, 10),
                OfferStyle().commonDescriptionText(
                    color: appCtrl.appTheme.darkContentColor,
                    text: OfferFont().desc1),
                const Space(0, 20),
                OfferStyle().commonDescriptionText(
                    color: appCtrl.appTheme.darkContentColor,
                    text: OfferFont().desc2),
              ],
            )),
      );
    });
  }
}
