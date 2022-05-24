import '../../../config.dart';

class HowDoOrderCard extends StatelessWidget {
  final dynamic data;
  final Color? containerColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? primaryColor;
  final Color? whiteColor;

  const HowDoOrderCard(
      {Key? key,
      this.data,
      this.containerColor,
      this.titleColor,
      this.darkContentColor,
      this.primaryColor,
      this.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
        child: Stack(
          alignment: appCtrl.languageVal == "ar" || appCtrl.isRTL
              ? Alignment.centerRight
              : Alignment.centerLeft,
          children: [
            AboutUsStyle().textLayout(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutUsStyle()
                      .commonTitle(text: data['title'], color: titleColor),
                  const Space(0, 5),
                  AboutUsFontStyle().mulishtextLayout(
                      text: data['desc'],
                      overflow: TextOverflow.clip,
                      height: 1.7,
                      fontWeight: FontWeight.normal,
                      fontSize: AboutUsFontSize.textSizeSmall,
                      color: darkContentColor)
                ]),languageVal: appCtrl.languageVal,isRTL: appCtrl.isRTL,containerColor: containerColor),
            AboutUsStyle().idLayout(
                text: data['id'],
                primaryColor: primaryColor,
                whiteColor: whiteColor)
          ],
        ),
      );
    });
  }
}
