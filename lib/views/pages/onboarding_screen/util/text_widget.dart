import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config.dart';

//Quick Sand Text Style Widget
class QuickSandTextWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;

  QuickSandTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: GoogleFonts.quicksand(
          color: appCtrl.appTheme.titleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }
}

//Nunito Sans Text Widget style
class NunitoSansTextWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;

  NunitoSansTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        color: appCtrl.appTheme.contentColor,
        fontSize: 14,
      ),
    );
  }
}

//Mulish Text Widget style
class MulishTextWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;

  MulishTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: GoogleFonts.mulish(
        color: appCtrl.appTheme.titleColor,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
