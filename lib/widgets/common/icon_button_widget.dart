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


  IconButtonWidget({Key? key, this.icon, this.textWidget, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: appCtrl.appTheme.lightGray,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon!),
          Space(10, 0),
          textWidget!

        ],
      ),
    ).marginOnly(left: 15, right: 15).gestures(onTap: () {
      if (type == 'phone') {
        Get.toNamed(routeName.login);
      }
    });
  }
}
