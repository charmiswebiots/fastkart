
import 'package:fastkart/views/pages/404_screen/util/404_fontstyle.dart';
import 'package:flutter/material.dart';

class Error404Widget{

  //common icon image layout
  Widget commonIconImage({String? image,double? height}){
    return Image.asset(image!,height: height  ,);
  }

  //back to home widget
Widget backToHomeWidget({String? text,color,GestureTapCallback? onTap,fontColor,BuildContext? context}){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context!).size.width / 2.5,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Error404FontStyle().mulishtextLayout(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );

}
}