import 'package:fastkart/controllers/shop_controller.dart';
import 'package:fastkart/views/pages/shop/util/shop_constants.dart';
import 'package:fastkart/views/pages/shop/util/shop_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ShopListCard extends StatelessWidget {
  var data;
  var containerboxColor;
  var dividerColor;
  var titleColor;
  var descriptionColor;
  var discountBoxColor;
  var discountTextColor;
  var quantityBorderColor;
  int? index;
  GestureTapCallback? minusTap;
  GestureTapCallback? plusTap;

  ShopListCard({
    Key? key,
    this.data,
    this.titleColor,
    this.containerboxColor,
    this.descriptionColor,
    this.discountBoxColor,
    this.dividerColor,
    this.discountTextColor,
    this.quantityBorderColor,
    this.minusTap,
    this.plusTap,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == 3  ?  Padding(
      padding:EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(data['image'],height: AppScreenUtil().screenHeight(120),fit: BoxFit.fill,),
          ShopFontStyle().quicksandtextLayout(text: data['name'],fontWeight: FontWeight.w500,fontSize: 16,)
        ],
      ),
    ) :Container(
      margin: EdgeInsets.symmetric(
        vertical: AppScreenUtil().screenHeight(10),
        horizontal: AppScreenUtil().screenHeight(15),

      ),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(15),
          horizontal: AppScreenUtil().screenHeight(10)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: containerboxColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppScreenUtil().borderRadius(10)),
            bottomLeft: Radius.circular(AppScreenUtil().borderRadius(10))),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              data['image'].toString(),
              fit: BoxFit.fill,
              height: AppScreenUtil().screenHeight(45),
              width: AppScreenUtil().screenWidth(50),
            ),
            Space(5, 0),
            VerticalDivider(
              color: dividerColor,
              width: 5,
              indent: 10,
              endIndent: 10,
              thickness: .5,
            ),
            Space(5, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShopFontStyle().mulishtextLayout(
                    text: data['name'], fontSize: 13, color: titleColor),
                Space(0, 2),
                ShopFontStyle().mulishtextLayout(
                    text: data['description'],
                    fontSize: 13,
                    color: descriptionColor),
                Row(
                  children: [
                    ShopFontStyle().mulishtextLayout(
                        text: ShopFont().dollar + data['price'].toString(),
                        fontSize: 12,
                        color: titleColor,
                        fontWeight: FontWeight.w700),
                    Container(
                      decoration: BoxDecoration(
                          color: discountBoxColor,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(
                          left: AppScreenUtil().screenHeight(5)),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(10),
                          vertical: AppScreenUtil().screenHeight(3)),
                      child: ShopFontStyle().mulishtextLayout(
                        text: data['discount'].toString(),
                        fontSize: 10,
                        color: discountTextColor,
                      ),
                    ),
                    Space(45, 0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().screenHeight(8),
                          horizontal: AppScreenUtil().screenWidth(8)),
                      decoration: BoxDecoration(
                          color: discountTextColor,
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          border: Border.all(color: quantityBorderColor)),
                      child: GetBuilder<ShopController>(
                        builder: (controller) => Row(
                          children: [
                            InkWell(
                                onTap: minusTap,
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                )),
                            Space(10, 0),
                            Text(data['quantity'].toString()),
                            Space(10, 0),
                            InkWell(
                                onTap: plusTap,
                                child: Icon(Icons.add, size: 18)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
