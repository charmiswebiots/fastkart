import 'package:flutter/material.dart';

import '../../config.dart';

class PriceDetailLayout extends StatelessWidget {
  const PriceDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
        padding:
        EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCartFontStyle().mulishtextLayout(
                text: MyCartFont().orderDetails,
                color: appCtrl.appTheme.titleColor,
                fontSize: MyCartFontSize.textSizeSMedium,
                fontWeight: FontWeight.w600),
            Space(0, 15),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().bagTotal,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: MyCartFont().dollar + '220.00',
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.darkContentColor),
            Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().bagSavings,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: '-${MyCartFont().dollar}20.00',
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.primary),
            Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().couponDiscount,
                titleColor: appCtrl.appTheme.darkContentColor,
                val: 'Apply Coupon',
                fontWeight: FontWeight.normal,
                valColor: appCtrl.appTheme.redColor),
            Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().delivery,
                titleColor: appCtrl.appTheme.darkContentColor,
                fontWeight: FontWeight.normal,
                val: MyCartFont().dollar + '50.00',
                valColor: appCtrl.appTheme.darkContentColor),
            Space(0, 10),
            Divider(),
            Space(0, 10),
            MyCartWidget().commonPriceDetail(
                title: MyCartFont().totalAmount,
                titleColor: appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.w600,
                val: MyCartFont().dollar + '270.00',
                valColor: appCtrl.appTheme.titleColor),
          ],
        ),
      );
    });
  }
}