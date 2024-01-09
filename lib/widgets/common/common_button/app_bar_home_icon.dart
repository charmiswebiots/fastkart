import 'package:fastkart/utilities/responsive_layout.dart';

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
                  ResponsiveWidget.isSmallScreen(context) ? 18 : 15),
              top: AppScreenUtil().screenHeight(
                  ResponsiveWidget.isSmallScreen(context) ? 18 : 15),
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
