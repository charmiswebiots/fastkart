import '../../../config.dart';

class DrawerCustomHeader extends StatelessWidget {
  final String? image;
  final double? borderRadius;
  final double? imageHeight;
  final String? userName;
  final String? userEmail;
  final double? nameFontSize;
  final double? emailFontSize;

  const DrawerCustomHeader(
      {Key? key,
      this.userEmail,
      this.userName,
      this.emailFontSize,
      this.nameFontSize,
      this.imageHeight,
      this.image,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        child: Row(
          children: [
            //user Image layout
            DrawerWidget().userImageLayout(
                borderRaius: 50,
                image: imageAssets.usersquare,
                imageHeight: 50),
            Space(10, 0),

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
            top: MediaQuery.of(context).size.height /
                AppScreenUtil().screenHeight(14),
            left: AppScreenUtil().screenWidth(30),
            right: AppScreenUtil().screenWidth(25)),
      );
    });
  }
}
