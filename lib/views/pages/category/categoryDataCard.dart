import 'package:fastkart/views/pages/category/util/category_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class CategoryData extends StatelessWidget {
  var data;
  var primaryColor;
  var listviewBGColor;
  var selectColor;
  int? index;
  int? lastIndex;
  int? selectIndex;
   CategoryData({Key? key,this.data,this.primaryColor,this.index,this.listviewBGColor,this.lastIndex,this.selectIndex,this.selectColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index == selectIndex ?selectColor : listviewBGColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil()
                .borderRadius(index == 0 ? 5 : 0)),
            bottomRight: Radius.circular(
                AppScreenUtil().borderRadius(index ==
                    lastIndex
                    ? 5
                    : 0))),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(8)),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                Image.asset(
                  data
                      .image,
                  height: AppScreenUtil()
                      .screenHeight(40),
                  width:
                  AppScreenUtil().screenWidth(40),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppScreenUtil()
                          .screenHeight(5)),
                  child: CategoryFontStyle().mulishtextLayout(
                    text: data.title,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          if (index !=
              lastIndex)
            Divider(
              color: index == selectIndex ?selectColor : primaryColor
                  .withOpacity(.1),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
        ],
      ),
    );
  }
}
