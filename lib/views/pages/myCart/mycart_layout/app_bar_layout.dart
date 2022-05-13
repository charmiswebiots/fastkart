

import '../../../../config.dart';

class AppBarLayoutCustom extends StatelessWidget
    implements PreferredSizeWidget {
  final GestureTapCallback? onTap;
  final GestureTapCallback? actionOnTap;

  const AppBarLayoutCustom({Key? key, this.onTap, this.actionOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return AppBar(
        titleSpacing: 5,
        toolbarHeight: AppScreenUtil().screenHeight(30),
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: AppScreenUtil().screenWidth(105),
        backgroundColor: appCtrl.appTheme.blackColor,
        centerTitle: false,
        leading: Row(
          children: [
            InkWell(
              onTap: onTap,
              child: MyCartWidget().appBarLeadingLayput(
                  child: Icon(
                    Icons.arrow_back_sharp,
                    size: AppScreenUtil().size(14),
                    color: appCtrl.appTheme.titleColor,
                  ),
                  textColor: appCtrl.appTheme.titleColor),
            ),
            MyCartFontStyle().mulishtextLayout(
                text: MyCartFont().myCart,
                fontWeight: FontWeight.w600,
                fontSize: MyCartFontSize.textSizeSMedium,
                color: appCtrl.appTheme.titleColor)
          ],
        ),
        title: MyCartStyle().appBarTitleLayout(
            text: "(4 Items)", textColor: appCtrl.appTheme.darkContentColor),
        actions: [
          MyCartWidget().appBarActionLayout(onTap: actionOnTap),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}
