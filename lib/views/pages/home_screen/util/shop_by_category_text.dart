import '../../../../config.dart';

class ShopByCategoryText extends StatelessWidget {
  const ShopByCategoryText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenHeight(15),
                right: AppScreenUtil().screenHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeStyle().lineBorderWidget(context: context, bordercolor: appCtrl.appTheme.greyBGColor),
                HomeWidget().shopByCategory(text: HomeFont().shopByCategory, color: appCtrl.appTheme.titleColor),
                HomeStyle().lineBorderWidget(context: context, bordercolor: appCtrl.appTheme.greyBGColor),
              ],
            ));
      }
    );
  }
}
