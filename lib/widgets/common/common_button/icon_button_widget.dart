import 'package:fastkart/config.dart';

class IconButtonWidget extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final String? icon;
  final Widget? textWidget;
  final String? type;
  final double? lefMargin;
  final double? rightMargin;
  final GestureTapCallback? onTap;

  IconButtonWidget(
      {Key? key,
      this.icon,
      this.textWidget,
      this.type,
      this.lefMargin,
      this.rightMargin,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppScreenUtil().size(12)),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.socialColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: AppScreenUtil().screenHeight(20),
            ),
            const Space(10, 0),
            textWidget!
          ],
        ),
      ).marginOnly(
          left: AppScreenUtil().screenWidth(lefMargin!),
          right: AppScreenUtil().screenWidth(rightMargin!)),
    );
  }
}
