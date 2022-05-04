import 'package:fastkart/controllers/order/orderDetail_controller.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_constants.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_fontstyle.dart';
import 'package:fastkart/views/orderPages/orderDetail/util/orderDetail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OrderDetail extends StatelessWidget {
  var orderDetailCtrl = Get.put(OrderDetailController());

  OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderDetailController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: OrderDetailWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: orderDetailCtrl.appCtrl.appTheme.titleColor,
                  iconColor: orderDetailCtrl.appCtrl.appTheme.titleColor,
                  image: orderDetailCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: OrderDetailWidget().appBarTitleLayout(
                  text: OrderDetailFont().orderSummary,
                  textColor: orderDetailCtrl.appCtrl.appTheme.titleColor),
              actions: [
                OrderDetailWidget().appBarActionLayout(
                    iconColor: orderDetailCtrl.appCtrl.appTheme.titleColor),
              ],
            ),
            backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                              padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(10)),
                              decoration: BoxDecoration(
                                  color:
                                      orderDetailCtrl.appCtrl.appTheme.primary,
                                  borderRadius: BorderRadius.circular(
                                      AppScreenUtil().borderRadius(10))),
                              child: Row(
                                children: [
                                  Image.asset(
                                    iconAssets.box,
                                    height: AppScreenUtil().screenHeight(30),
                                  ),
                                  Space(10, 0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      OrderDetailFontStyle().mulishtextLayout(
                                          text: 'Order ID: #5151515',
                                          fontSize: OrderDetailFontSize
                                              .textSizeSmall,
                                          color: orderDetailCtrl
                                              .appCtrl.appTheme.white),
                                      Space(0, 5),
                                      OrderDetailFontStyle().mulishtextLayout(
                                          text: OrderDetailFont().orderDelivery,
                                          letterSpacing: .5,
                                          fontSize: OrderDetailFontSize
                                              .textSizeMedium,
                                          fontWeight: FontWeight.w700,
                                          color: orderDetailCtrl
                                              .appCtrl.appTheme.white),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    //button layoout
                    OrderDetailWidget().orderTrackButtonLayout(
                        context: context,
                        buttonColor: orderDetailCtrl.appCtrl.appTheme.primary,
                        itemColor: orderDetailCtrl.appCtrl.appTheme.white)
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
