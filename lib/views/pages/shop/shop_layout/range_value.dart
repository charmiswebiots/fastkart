import '../../../../config.dart';

class RangeValueLayout extends StatelessWidget {
  final String? text;
  const RangeValueLayout({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenWidth(5),
              horizontal: AppScreenUtil().screenHeight(10)),
          decoration: BoxDecoration(
            color: appCtrl.isTheme
                ? appCtrl.appTheme.primary
                : appCtrl.appTheme.wishtListBoxColor,
            borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            border: Border.all(
                color: appCtrl.isTheme
                    ? appCtrl.appTheme.gray
                    : appCtrl.appTheme.primary.withOpacity(.2), width: .5), //border of dropdown button
          ),
          child: ShopFontStyle().mulishtextLayout(
              text: ShopFont().dollar + text!,
              fontSize: ShopFontSize.textSizeSmall,
              color: appCtrl.appTheme.titleColor),
        );
      }
    );
  }
}
