import 'package:flutter/material.dart';
import 'package:fastkart/common/theme/app_css.dart';
import 'package:fastkart/controllers/common/app_controller.dart';
import 'package:fastkart/extensions/spacing.dart';
import 'package:fastkart/extensions/textstyle_extensions.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final String title;
  final double padding;
  final double radius;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color;
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
    this.icon,
    this.width,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: color ?? appCtrl.appTheme.primary,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(padding),
              width: width ?? MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: border,
                borderRadius: radius > 0 ? BorderRadius.circular(radius) : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Row(
                      children: [
                        icon ?? const HSpace(0),
                        const HSpace(10),
                      ],
                    ),
                  Text(
                    title,
                    style: style ?? AppCss.h2.textColor(Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
