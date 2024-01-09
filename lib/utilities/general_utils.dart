import 'dart:developer';

import 'package:fastkart/controllers/common/app_controller.dart';
import 'package:get/get.dart';

var loadingCtrl = Get.find<AppController>();

//Language translate
String trans(String val) {
  if (val.isNotEmpty) {
    return val.tr;
  }
  return val;
}

//print log
printLog(val) {
  log(val);
}

//show loading
void showLoading() {
  return loadingCtrl.commonController.showLoading();
}

//hide loading after success or error
void hideLoading() {
  return loadingCtrl.commonController.hideLoading();
}

List arrayFilter(List val) {
  if (val.isNotEmpty) {
    List newArray = [];
    for (int i = 0; i < val.length; i++) {
      if (val[i] != null) {
        newArray.add(val[i]);
      }
    }
    return newArray;
  } else {
    return [];
  }

  //ex : helper.array_filter(data);
}
