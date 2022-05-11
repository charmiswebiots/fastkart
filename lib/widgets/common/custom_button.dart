import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:fastkart/common/theme/app_css.dart';
import 'package:fastkart/controllers/common/app_controller.dart';
import 'package:fastkart/extensions/spacing.dart';
import 'package:fastkart/extensions/textstyle_extensions.dart';
import 'package:get/get.dart';

import '../../config.dart';

class CustomButton extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final String title;
  final double padding;
  final double radius;
  final double? height;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? fontColor;
  final Widget? icon;
  final double? width;
  final Border? border;

  CustomButton({
    Key? key,
    required this.title,
    this.padding = 15,
    this.radius = 10,
    this.onTap,
    this.style,
    this.color,
    this.fontColor,
    this.icon,
    this.width,
    this.border,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(height!),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().size(10),),
        width: MediaQuery.of(context).size.width,
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: LoginFontStyle().mulishtextLayout(
            text: title,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }
}
