import 'package:fastkart/config.dart';
import 'package:flutter/cupertino.dart';

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
          child: OrderDetailStyle()
              .iconBack(iconColor: iconColor, borderColor: borderColor),
        ),
      ],
    );
  }

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: OrderDetailFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //common price detail layout
  Widget commonPriceDetail(
      {String? title,
      String? val,
      var titleColor,
      var valColor,
      var fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderDetailWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        OrderDetailWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //common title text layout
  Widget commonTitleText({String? title, var color}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: OrderDetailFontStyle().mulishtextLayout(
          text: title,
          fontSize: OrderDetailFontSize.textSizeSMedium,
          fontWeight: FontWeight.w700,
          color: color),
    );
  }

  //appbar layout
  PreferredSizeWidget appBarLayout(
      {var backgroundColor,
      var titleColor,
      String? image,
      GestureTapCallback? onTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderDetailWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: OrderDetailStyle().appBarTitleLayout(
          text: OrderDetailFont().orderSummary, textColor: titleColor),
      actions: [
        OrderDetailStyle()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }

  //multiply layout
  Widget multiplyIconLayout(titleColor){
    return Icon(
      CupertinoIcons.multiply,
      color: titleColor,
      size: AppScreenUtil().size(14),
    );
  }
}
