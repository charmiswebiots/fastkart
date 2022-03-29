import 'package:flutter/material.dart';

import '../../config.dart';

class ContactUsLayout extends StatelessWidget {
  var containerColor;
  Widget? child;
   ContactUsLayout({Key? key,this.containerColor,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: AppScreenUtil().screenHeight(150),
     // alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(left: AppScreenUtil().screenWidth(12),right: AppScreenUtil().screenWidth(12),top: AppScreenUtil().screenHeight(20),bottom: AppScreenUtil().screenHeight(15)),
      padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(20)),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(10))
      ),
      child: child  ,
    );
  }
}
