import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fastkart/views/pages/payment/util/payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class CashOnDeliveryLayout extends StatelessWidget {
  var titleColor;
  var contentColor;
  Widget? child;
  ValueChanged<bool>? onExpansionChanged;
  bool? isShow;
  String? text;
  var wishtListBoxColor;
  var containerColor;
  var primary;
  var keys;
  CashOnDeliveryLayout({Key? key,this.titleColor,this.child,this.onExpansionChanged,this.isShow,this.contentColor,this.text,this.wishtListBoxColor,this.primary,this.containerColor,this.keys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            key: Key(keys.toString()),
            tilePadding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(15)),
            childrenPadding: EdgeInsets.symmetric(
                horizontal:
                AppScreenUtil().screenWidth(5),
                vertical: 0),
            title: PaymentFontStyle().mulishtextLayout(
                text: text,
                fontWeight: FontWeight.w700,
                color: titleColor,
                fontSize:
                PaymentFontSize.textSizeSMedium),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: AppScreenUtil().size(16),
            ),
            onExpansionChanged: onExpansionChanged,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: AppScreenUtil()
                      .screenWidth(15),
                  right: AppScreenUtil()
                      .screenWidth(15),
                  top: AppScreenUtil()
                      .screenHeight(15.0),
                ),
                decoration: BoxDecoration(
                    color: wishtListBoxColor,
                    borderRadius: BorderRadius.circular(
                        AppScreenUtil()
                            .borderRadius(
                            AppScreenUtil()
                                .borderRadius(
                                5))),
                    border: Border.all(
                        color:  primary)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil()
                                .screenWidth(10),
                            vertical: AppScreenUtil()
                                .screenHeight(15)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [

                            PaymentFontStyle().nunitotextLayout(
                                text: PaymentFont().cashonDelivery,
                                fontWeight:
                                FontWeight.w700,
                                fontSize: PaymentFontSize
                                    .textSizeSMedium,
                                color: titleColor),
                          ],
                        )),

                      PaymentWidget().checkIcon(iconColor: containerColor,containerColor: primary)
                  ],
                ),
              )
            ],
          ),

          Divider(
            color: contentColor,
            thickness: .5,
            indent: 15,
            endIndent: 15,
            height: 0,
          )
        ],
      ),
    );
  }
}
