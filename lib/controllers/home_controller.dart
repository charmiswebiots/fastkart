import 'dart:convert';

import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:flutter/services.dart';

class HomeController extends GetxController {
  List offerList = [];
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

//quantity increment function
  plusTap(index) {
    print(offerList[index]['quantity']);
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['quantity'] != 0) {
      print(offerList[index]['quantity']);
      if (offerList[index]['quantity'] == "0") {
        offerList[index]['quantity'] = "0";
        update();
      } else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    offerList = AppArray().offerList;
    update();
    loadLocalRecipe();
    super.onInit();
  }

  Future<List<RecipeModel>> loadLocalRecipe() async {
    try {
      String response =
          await rootBundle.loadString('assets/jsonFile/userlist.json');

      List<dynamic> result = json.decode(response);
      print('result : $result');
      return result.map((n) => RecipeModel.fromJson(n)).toList();
    } catch (e) {
      throw Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    offerList = AppArray().offerList;
    update();
    super.onReady();
  }
}

class RecipeModel {
  RecipeModel({
    required this.image,
  });

  String image;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        image: json["image"] == null ? null : json["image"],
      );
}
