import 'package:fastkart/config.dart';
import 'package:flutter/cupertino.dart';

class OrderDetailStyle {
  // items text layout
  Widget commonTextLayout(text, primaryColor) {
    return OrderDetailWidget()
        .commonTitleText(title: text, color: primaryColor);
  }

  //payment method layout
  Widget paymentMethodLayout(titleColor) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Row(children: [
          Image.asset(
            imageAssets.masterCard1,
            height: AppScreenUtil().screenHeight(30),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: OrderDetailFontStyle().mulishtextLayout(
                text: "**** **** **** 6502",
                fontSize: OrderDetailFontSize.textSizeSmall,
                fontWeight: FontWeight.normal,
                color: titleColor),
          )
        ]));
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //quantity layout
  Widget quantityLayout({var quantityLayoutColor, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(7),
          vertical: AppScreenUtil().screenHeight(4)),
      decoration: BoxDecoration(
          color: quantityLayoutColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }

  //multiply layout
  Widget multiplyIconLayout(titleColor) {
    return Icon(CupertinoIcons.multiply,
        color: titleColor, size: AppScreenUtil().size(14));
  }
}
