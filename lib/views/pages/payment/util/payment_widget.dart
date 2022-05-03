import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class PaymentWidget {

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: PaymentFontSize.textSizeSMedium,
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
        PaymentWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        PaymentWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }



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
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }


  //proceedPayment button layout
  Widget proceedPaymentButtonLayout({context, var buttonColor, var itemColor}) {
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
      child: PaymentFontStyle().mulishtextLayout(
          text: PaymentFont().confirmPayment,
          color: itemColor,
          fontSize: PaymentFontSize.textSizeMedium),
    );
  }

  //add address layout
  Widget addAddressLayout({context,var borderColor,var color,GestureTapCallback? onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        alignment: Alignment.center,
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor),
            borderRadius: BorderRadius.circular(
                AppScreenUtil().borderRadius(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: color),
            PaymentFontStyle().mulishtextLayout(
                text: PaymentFont().addAddress,
                fontSize: PaymentFontSize.textSizeSMedium,
                color: color),
          ],
        ),
      ),
    );
  }


  //check icon Layout
  Widget checkIcon({var iconColor, var containerColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(3),
          vertical: AppScreenUtil().screenHeight(2)),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(5)),
              bottomLeft: Radius.circular(AppScreenUtil().borderRadius(5)))),
      child: Icon(
        Icons.check,
        size: AppScreenUtil().size(16),
        color: iconColor,
      ),
    );
  }
}
