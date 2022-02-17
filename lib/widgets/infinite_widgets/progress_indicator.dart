import 'package:fastkart/controllers/common/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(appCtrl.appTheme.primary),
        strokeWidth: 3,
      ),
    );
  }
}
