import 'package:fastkart/views/pages/productDetail/util/productDetail_constants.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_fontstyle.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class GridViewLayoutCard extends StatelessWidget {
  var data;
  var containerColor;
  var primaryColor;
  var borderColor;
  var textColor;
  var iconColor;
  int? index;
  int? quantityIndex;
  GestureTapCallback? onTap;
  GridViewLayoutCard({Key? key,this.data,this.containerColor,this.primaryColor,this.textColor,this.iconColor,this.borderColor,this.quantityIndex,this.index,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(2),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(5)),
          border: Border.all(
              color: quantityIndex == index
                  ? primaryColor
                  : borderColor,
              width: 1), //border of dropdown button
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(10)),
              alignment: Alignment.centerLeft,
              child: ProductDetailFontStyle().mulishtextLayout(
                  text: data['title']
                      .toString(),
                  fontSize: ProductDetailFontSize.textSizeSMedium,
                  color: textColor),
            ),
            if(quantityIndex == index)
              ProductDetailWidget().checkIcon(containerColor: primaryColor,iconColor:iconColor),

          ],
        ),
      ),
    );
  }
}
