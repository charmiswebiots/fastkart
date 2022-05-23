import '../../../config.dart';

class AppBarHomeIconLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? icon;
  const AppBarHomeIconLayout({Key? key,this.onTap,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
              bottom: AppScreenUtil().screenHeight(
                  AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
              top: AppScreenUtil().screenHeight(
                  AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
              right: AppScreenUtil().screenWidth(15)),
          child: InkWell(
            onTap: onTap,
            child: Image.asset(icon!,
                color: appCtrl.appTheme.titleColor,
                height: AppScreenUtil().screenHeight(20),
                fit: BoxFit.contain),
          ),
        );
      }
    );
  }
}
