import 'package:fastkart/controllers/order/orderTrack_controller.dart';
import 'package:fastkart/views/orderPages/orderTrack/util/orderTrack_constants.dart';
import 'package:fastkart/views/orderPages/orderTrack/util/orderTrack_fontstyle.dart';
import 'package:fastkart/views/orderPages/orderTrack/util/orderTrack_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OrderTrack extends StatelessWidget {
  var orderTrackCtrl = Get.put(OrderTrackController());

  OrderTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderTrackController>(builder: (_) {
          return Scaffold(
            appBar: OrderTrackWidget().appBarLayout(
              bgColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,titleColor: orderTrackCtrl.appCtrl.appTheme.titleColor,image: orderTrackCtrl.appCtrl.isTheme
                ? imageAssets.themeLogo
                : imageAssets.logo,
              onTap: ()=> orderTrackCtrl.goToHome()
            ),
            backgroundColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        //success image layout
                        SingleChildScrollView(
                            child: OrderTrackWidget()
                                .backgroundLayout(context: context)),
                        OrderTrackWidget().contentBGLayout(
                            context: context,
                            color: orderTrackCtrl.appCtrl.appTheme.whiteColor,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //estimated delivery text layout
                                  OrderTrackFontStyle().mulishtextLayout(
                                      text: OrderTrackFont().estimateTime,
                                      color: orderTrackCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  //estimated delivery text value layout
                                  OrderTrackFontStyle().mulishtextLayout(
                                      text: "9.00am - 12.00pm",
                                      fontWeight: FontWeight.bold,
                                      fontSize: OrderTrackFontSize
                                          .textSizeLargeMedium,
                                      color: orderTrackCtrl
                                          .appCtrl.appTheme.primary),
                                  Space(0, 5),
                                  //line divider layout
                                  Divider(
                                    color: orderTrackCtrl
                                        .appCtrl.appTheme.contentColor,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  Space(0, 5),

                                  //user layout
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OrderTrackWidget().userLayout(
                                            image: imageAssets.usersquare,
                                            titleColor: orderTrackCtrl
                                                .appCtrl.appTheme.titleColor,
                                            darkContentColor: orderTrackCtrl
                                                .appCtrl
                                                .appTheme
                                                .darkContentColor),
                                        Row(
                                          children: [
                                            OrderTrackWidget()
                                                .commonLayoutForIcon(
                                                    image: iconAssets.call,
                                                    boxColor: orderTrackCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .primary,
                                                    borderColor: orderTrackCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .primary),
                                            Space(15, 0),
                                            OrderTrackWidget()
                                                .commonLayoutForIcon(
                                                    image: iconAssets.chat,
                                                    boxColor: orderTrackCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .whiteColor,
                                                    borderColor: orderTrackCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .primary),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Space(0, 5),
                                  //line divider layout
                                  Divider(
                                    color: orderTrackCtrl
                                        .appCtrl.appTheme.contentColor,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  Space(0, 5),

                                  //address layout
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(15)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            OrderTrackWidget().addressLayout(
                                              titleColor: orderTrackCtrl
                                                  .appCtrl
                                                  .appTheme
                                                  .titleColor,
                                              containerColor:  orderTrackCtrl
                                                  .appCtrl
                                                  .appTheme
                                                  .primary,
                                              decColor: orderTrackCtrl
                                                  .appCtrl
                                                  .appTheme
                                                  .darkContentColor
                                            ),
                                            OrderTrackWidget().verticalLineDivider(),
                                            OrderTrackWidget().addressLayout(
                                                titleColor: orderTrackCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor,
                                                containerColor:  orderTrackCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .primary,
                                                decColor: orderTrackCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .darkContentColor
                                            ),
                                            Space(0, 80)
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                    //button layout
                    OrderTrackWidget().orderDetailButtonLayout(
                        context: context,
                        onTap: () => Get.toNamed(routeName.orderDetail),
                        buttonColor: orderTrackCtrl.appCtrl.appTheme.primary,
                        itemColor: orderTrackCtrl.appCtrl.appTheme.white)
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
