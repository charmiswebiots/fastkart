import 'package:fastkart/config.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_constants.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class OrderDetailWidget {
  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(15),
          top: AppScreenUtil().screenHeight(13),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.drawerHome,
        color: iconColor,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
      ),
    );
  }

  //orderTrack button layout
  Widget orderTrackButtonLayout({context, var buttonColor, var itemColor}) {
    return Container(
      height: AppScreenUtil().screenHeight(45),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: OrderDetailFontStyle().mulishtextLayout(
          text: OrderDetailFont().reorder,
          color: itemColor,
          fontSize: OrderDetailFontSize.textSizeMedium),
    );
  }
}
