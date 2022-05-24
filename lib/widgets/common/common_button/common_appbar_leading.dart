import '../../../config.dart';

class CommonAppBarLeading extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? isImage;

  const CommonAppBarLeading({Key? key, this.onTap, this.isImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: AppScreenUtil().screenHeight(
                  AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
              width: AppScreenUtil().screenHeight(
                  AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
              margin: EdgeInsets.only(
                  left: AppScreenUtil().screenWidth(15),
                  right: AppScreenUtil().screenWidth(8)),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: appCtrl.appTheme.titleColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.arrow_back_sharp,
                size: AppScreenUtil().size(14),
                color: appCtrl.appTheme.titleColor,
              ),
            ),
          ),
          if (isImage!)
            Image.asset(
              appCtrl.isTheme ? imageAssets.themeFkLogo : imageAssets.fkLogo,
              height: AppScreenUtil().screenHeight(16),
              fit: BoxFit.contain,
            )
        ],
      );
    });
  }
}
