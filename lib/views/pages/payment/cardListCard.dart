import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fastkart/views/pages/payment/util/payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class CardList extends StatelessWidget {
  GestureTapCallback? onTap;
  var data;
  var wishtListBoxColor;
  var primary;
  var titleColor;
  var containerColor;
  int? selectedIndex;
  int? index;
  CardList({Key? key,this.onTap,this.data,this.wishtListBoxColor,this.selectedIndex,this.index,this.primary,this.containerColor,this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                color: selectedIndex == index
                    ? primary
                    : wishtListBoxColor)),
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
                        .screenHeight(12)),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .center,
                  children: [
                    Image.asset(
                      data['icon']
                          .toString(),
                      height: AppScreenUtil()
                          .screenHeight(20),
                    ),
                    Space(10, 0),
                    PaymentFontStyle().nunitotextLayout(
                        text: data['number'],
                        fontWeight:
                        FontWeight.w700,
                        fontSize: PaymentFontSize
                            .textSizeSmall,
                        color: titleColor),
                  ],
                )),
            if(selectedIndex == index)
              PaymentStyle().checkIcon(iconColor: containerColor,containerColor: primary)
          ],
        ),
      ),
    );
  }
}
