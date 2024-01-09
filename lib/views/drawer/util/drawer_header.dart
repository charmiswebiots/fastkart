import '../../../config.dart';

class DrawerCustomHeader extends StatelessWidget {
  final String? image;
  final double? borderRadius;
  final double? imageHeight;
  final String? userName;
  final String? userEmail;
  final double? nameFontSize;
  final double? emailFontSize;
  final Color? color;
  final bool? isYourAccount;

  const DrawerCustomHeader(
      {Key? key,
      this.userEmail,
      this.userName,
      this.emailFontSize,
      this.nameFontSize,
      this.imageHeight,
      this.image,
      this.borderRadius,this.color,this.isYourAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth( isYourAccount! ? 10 : 0),vertical: AppScreenUtil().screenHeight( isYourAccount! ? 15:0)),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(10))
        ),
        child: Row(
          children: [
            //user Image layout
            DrawerWidget().userImageLayout(
                borderRaius: 50,
                image: imageAssets.usersquare,
                imageHeight: 50),
            const Space(10, 0),

            //user name and email layout
            DrawerWidget().userNameAndEmailLayout(
                userName: userName,
                userEmail: userEmail,
                userNameFontColor: appCtrl.appTheme.titleColor,
                emailFontColor: appCtrl.appTheme.darkContentColor,
                nameFontSize: nameFontSize,
                emailFontSize: emailFontSize),
          ],
        ).paddingOnly(
            top: isYourAccount! ? 0 : MediaQuery.of(context).size.height /
                AppScreenUtil().screenHeight(14),
            left: AppScreenUtil().screenWidth(15),
            right: AppScreenUtil().screenWidth(25)),
      ).marginOnly(

          left: AppScreenUtil().screenWidth(isYourAccount! ? 10 : 0),
          right: AppScreenUtil().screenWidth(isYourAccount! ? 10 : 0));
    });
  }
}
