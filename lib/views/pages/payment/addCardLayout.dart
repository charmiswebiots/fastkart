import 'package:fastkart/controllers/payment_controller.dart';
import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fastkart/views/pages/payment/util/payment_widget.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_constants.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class AddCardLayout extends StatelessWidget {
  var primaryColor;
  var hintColor;
  var fillcolor;
  TextEditingController? txtName;
  TextEditingController? txtnumber;
  TextEditingController? txtExpiryDate;
  TextEditingController? txtCV;
  var textColor;
  var closeContainerColor;
  var cancelTextColor;
  GestureTapCallback? closeTap;
  GestureTapCallback? applyTap;

  AddCardLayout(
      {Key? key,
      this.primaryColor,
      this.hintColor,
      this.fillcolor,
      this.textColor,
      this.txtName,
      this.txtCV,
      this.txtExpiryDate,
      this.txtnumber,this.applyTap,this.closeTap,this.cancelTextColor,this.closeContainerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (ctrl) {
      return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
          ),
          height: MediaQuery.of(context).size.height /
              AppScreenUtil().screenHeight(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentFontStyle().mulishtextLayout(
                  text: PaymentFont().addCard,
                  fontWeight: FontWeight.w600,
                  fontSize: ProductDetailFontSize.textSizeSMedium,
                  color: textColor),
              Space(0, 20),
              //card holder name textformfield layout
              PaymentWidget().textFieldLayout(
                controller: txtName,
                text: PaymentFont().cardHolderName,
                borderColor: primaryColor.withOpacity(.3),
                hintColor: hintColor,
                fillcolor: fillcolor,
              ),
              Space(0, 20),
              //card holder name textformfield layout
              PaymentWidget().textFieldLayout(
                controller: txtnumber,
                text: PaymentFont().cardNumber,
                borderColor: primaryColor.withOpacity(.3),
                hintColor: hintColor,
                fillcolor: fillcolor,
              ),
              Space(0, 20),
              //card holder name textformfield layout
              Row(
                children: [
                  Expanded(
                    child: PaymentWidget().textFieldLayout(
                      controller: txtExpiryDate,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                      ),
                      text: PaymentFont().expiryDate,
                      borderColor: primaryColor.withOpacity(.3),
                      hintColor: hintColor,
                      fillcolor: fillcolor,
                    ),
                  ),
                  Space(10, 0),
                  Expanded(
                    child: PaymentWidget().textFieldLayout(
                      controller: txtCV,
                      text: PaymentFont().cv,
                      borderColor: primaryColor.withOpacity(.3),
                      hintColor: hintColor,
                      fillcolor: fillcolor,
                    ),
                  ),
                ],
              ),
              Space(0, 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PaymentWidget().commonButtonWidget(
                      containerColor: closeContainerColor,
                      context: context,
                      borderColor: primaryColor,
                      onTap: closeTap,
                      textColor: primaryColor,
                      text: ProductDetailFont().close),
                  PaymentWidget().commonButtonWidget(
                      containerColor: primaryColor,
                      context: context,
                      onTap: applyTap,
                      borderColor: primaryColor,
                      textColor: cancelTextColor,
                      text: ProductDetailFont().apply),
                ],
              )
            ],
          ));
    });
  }
}
