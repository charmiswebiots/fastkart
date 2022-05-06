import 'package:fastkart/views/pages/aboutUs/util/aboutUs_constants.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_fontstyle.dart';
import 'package:fastkart/views/pages/aboutUs/util/aboutUs_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class HowDoOrderCard extends StatelessWidget {
  var data;
  var containerColor;
  var titleColor;
  var darkContentColor;
  var primaryColor;
  var whiteColor;
   HowDoOrderCard({Key? key,this.data,this.containerColor,this.titleColor,this.darkContentColor,this.primaryColor,this.whiteColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                ),
            padding: EdgeInsets.only(
                left:
                AppScreenUtil().screenWidth(30),
                right:
                AppScreenUtil().screenWidth(10),
                top:
                AppScreenUtil().screenHeight(18),bottom:
            AppScreenUtil().screenHeight(18)),

            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(
                    AppScreenUtil().borderRadius(5))),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                AboutUsWidget().commonTitle(
                    text: data
                    ['title'],

                    color: titleColor),
                Space(0,5),
                AboutUsFontStyle().mulishtextLayout(
                    text: data
                    ['desc'],
                    overflow: TextOverflow.clip,
                    height: 1.7,
                    fontWeight: FontWeight.normal,
                    fontSize:
                    AboutUsFontSize.textSizeSmall,
                    color: darkContentColor),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(11),vertical: AppScreenUtil().screenHeight(7)),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
            ),
            child:AboutUsWidget().commonTitle(
                text: data
                ['id'],

                color: whiteColor),

          ),

        ],
      ),
    );
  }
}
