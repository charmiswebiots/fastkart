import '../../config.dart';

class ContactUsLayout extends StatelessWidget {
  final double? height;

  const ContactUsLayout({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        height: AppScreenUtil().screenHeight(150),
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(12),
            right: AppScreenUtil().screenWidth(12),
            top: AppScreenUtil().screenHeight(20),
            bottom: AppScreenUtil().screenHeight(15)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(20)),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.arrowSelectColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //contact support text layout
            DrawerStyle().contactSupport(
                title: DrawerFont().contactSupport,
                fontSize: 13,
                color: appCtrl.appTheme.titleColor),
            const Space(0, 5),

            //contact support description
            DrawerFontStyle().mulishtextLayout(
                text: DrawerFont().contactSupportDesc,
                fontSize: 12,
                color: appCtrl.appTheme.darkContentColor,
                overflow: TextOverflow.clip),
            const Space(0, 15),

            //contact us button
            ContactButton(
                text: DrawerFont().contactUs,
                buttonColor: appCtrl.appTheme.primary,
                textColor: appCtrl.appTheme.white)
          ],
        ),
      );
    });
  }
}
