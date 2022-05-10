import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_constants.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ItemListCard extends StatelessWidget {
  var data;
  var quantityLayoutColor;
  var quantityTextColor;
  var titleColor;
  var darkContentColor;
  var contentColor;
  int? index;
  int? lastIndex;
   ItemListCard({Key? key,this.data,this.quantityLayoutColor,this.quantityTextColor,this.titleColor,this.contentColor,this.darkContentColor,this.index,this.lastIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom:
          AppScreenUtil().screenHeight(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil()
                            .screenWidth(7),
                        vertical: AppScreenUtil()
                            .screenHeight(4)),
                    decoration: BoxDecoration(
                        color: quantityLayoutColor,
                        borderRadius: BorderRadius
                            .circular(AppScreenUtil()
                            .borderRadius(5))),
                    child: OrderDetailFontStyle()
                        .mulishtextLayout(
                        text: data['quantity']
                            .toString(),
                        color: quantityTextColor,
                        fontSize:
                        OrderDetailFontSize
                            .textSizeSmall),
                  ),
                  Space(10, 0),
                  Icon(
                    CupertinoIcons.multiply,
                    color: titleColor,
                    size: AppScreenUtil().size(14),
                  ),
                  Space(10, 0),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      OrderDetailFontStyle()
                          .mulishtextLayout(
                          text:
                          data
                          ['name']
                              .toString(),
                          color: titleColor,
                          fontSize:
                          OrderDetailFontSize
                              .textSizeSmall),
                      Space(0, 5),
                      OrderDetailFontStyle()
                          .mulishtextLayout(
                          text:
                          data
                          ['gram']
                              .toString(),
                          color: darkContentColor,
                          fontSize:
                          OrderDetailFontSize
                              .textSizeSmall),
                    ],
                  )
                ],
              ),
              OrderDetailFontStyle()
                  .mulishtextLayout(
                  text: data['price']
                      .toString(),
                  color: titleColor,
                  fontSize:
                  OrderDetailFontSize
                      .textSizeSMedium),
            ],
          ),
          Space(0, 8),
          if(index != lastIndex)
            Divider(color: contentColor,thickness: .5,)
        ],
      ),
    );
  }
}
