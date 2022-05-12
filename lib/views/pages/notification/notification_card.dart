import 'package:fastkart/views/pages/notification/util/notification_constants.dart';
import 'package:fastkart/views/pages/notification/util/notification_fontstyle.dart';
import 'package:fastkart/views/pages/notification/util/notification_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class NotificationCard extends StatelessWidget {
  var data;
  var titleColor;
  var dateColor;
  var primaryColor;
  NotificationCard({Key? key,this.data,this.titleColor,this.dateColor,this.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppScreenUtil()
              .screenHeight(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                NotificationWidget().iconLayout(color: data['bgColor'],icon: data['iconAssets']),
                Space(10, 0),
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NotificationFontStyle()
                          .mulishtextLayout(
                          text: data['title'],
                          fontSize:
                          NotificationFontSize
                              .textSizeSSmall,
                          fontWeight: FontWeight.w600,
                          color:titleColor),
                      Space(0, 5),
                      NotificationFontStyle()
                          .mulishtextLayout(
                          text: data['dateTime'],
                          fontSize:
                          NotificationFontSize
                              .textSizeSmall,
                          color:dateColor),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenHeight(5)),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))

            ),
            child:  NotificationFontStyle()
                .mulishtextLayout(
                text: data['type'],
                fontSize:
                NotificationFontSize
                    .textSizeSmall,
                color:primaryColor),
          )
        ],
      ),
    );
  }
}
