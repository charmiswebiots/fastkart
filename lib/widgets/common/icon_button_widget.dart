import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_fontstyle.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? icon;
  Widget? textWidget;
  String? type;
  double? lefMargin;
  double? rightMargin;
  GestureTapCallback? onTap;


  IconButtonWidget({Key? key, this.icon, this.textWidget, this.type,this.lefMargin,this.rightMargin,this.onTap}) : super(key: key);

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
            Image.asset(icon!,height: AppScreenUtil().screenHeight(20),),
            Space(10, 0),
            textWidget!

          ],
        ),
      ).marginOnly(left: AppScreenUtil().screenWidth(lefMargin!), right: AppScreenUtil().screenWidth(rightMargin!)),
    );
  }
}
