import 'package:fastkart/config.dart';

class AppBarWidgetLayout extends StatelessWidget
    implements PreferredSizeWidget {
  final GestureTapCallback? onTap;

  const AppBarWidgetLayout({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: appCtrl.appTheme.whiteColor,
        leadingWidth: AppScreenUtil().screenWidth(100),
        leading: ShopWidget().appBarLeadingLayput(
            onTap: () => Get.back(),
            borderColor: appCtrl.appTheme.titleColor,
            iconColor: appCtrl.appTheme.titleColor,
            image:
                appCtrl.isTheme ? imageAssets.themeFkLogo : imageAssets.fkLogo),
        title: ShopWidget().appBarTitleLayout(
            text: "Fresh Fruits& Vegetables",
            textColor: appCtrl.appTheme.darkContentColor),
        actions: [
          ShopWidget().appBarActionLayout(onTap: onTap),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
