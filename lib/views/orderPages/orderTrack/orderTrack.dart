import 'package:fastkart/controllers/order/orderTrack_controller.dart';
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
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: OrderTrackWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: orderTrackCtrl.appCtrl.appTheme.titleColor,
                  iconColor: orderTrackCtrl.appCtrl.appTheme.titleColor,
                  image: orderTrackCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: OrderTrackWidget().appBarTitleLayout(
                  image: orderTrackCtrl.appCtrl.isTheme
                      ? imageAssets.themeLogo
                      : imageAssets.logo,
                  textColor: orderTrackCtrl.appCtrl.appTheme.titleColor),
              actions: [
                OrderTrackWidget().appBarActionLayout(
                    iconColor: orderTrackCtrl.appCtrl.appTheme.titleColor),
              ],
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
                        SingleChildScrollView(child: OrderTrackWidget().backgroundLayout(context: context)),
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
                                    padding:EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OrderTrackWidget().userLayout(image: imageAssets.usersquare,titleColor: orderTrackCtrl
                                            .appCtrl.appTheme.titleColor,darkContentColor: orderTrackCtrl
                                            .appCtrl.appTheme.darkContentColor),
                                        Row(
                                          children: [
                                           OrderTrackWidget().commonLayoutForIcon(image: iconAssets.call,boxColor: orderTrackCtrl.appCtrl.appTheme.primary,borderColor: orderTrackCtrl.appCtrl.appTheme.primary),
                                           Space(15,0),
                                           OrderTrackWidget().commonLayoutForIcon(image: iconAssets.chat,boxColor: orderTrackCtrl.appCtrl.appTheme.whiteColor,borderColor: orderTrackCtrl.appCtrl.appTheme.primary),
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
                                    padding:EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                OrderTrackWidget().commonLayoutForIcon(image: iconAssets.home,boxColor: orderTrackCtrl.appCtrl.appTheme.primary,borderColor: orderTrackCtrl.appCtrl.appTheme.primary),
                                                Space(10,0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    OrderTrackFontStyle().mulishtextLayout(
                                                        text: "8857 Morris Rd. ,Charlottesville, VA 22901",
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: OrderTrackFontSize
                                                            .textSizeSmall,

                                                        color: orderTrackCtrl
                                                            .appCtrl.appTheme.titleColor),
                                                    OrderTrackFontStyle().mulishtextLayout(
                                                        text: "Store Location",
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: OrderTrackFontSize
                                                            .textXSizeSmall,

                                                        color: orderTrackCtrl
                                                            .appCtrl.appTheme.darkContentColor),

                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
                                              child: Image.asset(iconAssets.line,height: AppScreenUtil().screenHeight(30),),
                                            ),
                                            Row(
                                              children: [
                                                OrderTrackWidget().commonLayoutForIcon(image: iconAssets.home,boxColor: orderTrackCtrl.appCtrl.appTheme.primary,borderColor: orderTrackCtrl.appCtrl.appTheme.primary),
                                                Space(10,0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    OrderTrackFontStyle().mulishtextLayout(
                                                        text: "8857 Morris Rd. ,Charlottesville, VA 22901",
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: OrderTrackFontSize
                                                            .textSizeSmall,

                                                        color: orderTrackCtrl
                                                            .appCtrl.appTheme.titleColor),
                                                    OrderTrackFontStyle().mulishtextLayout(
                                                        text: "Store Location",
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: OrderTrackFontSize
                                                            .textXSizeSmall,

                                                        color: orderTrackCtrl
                                                            .appCtrl.appTheme.darkContentColor),

                                                  ],
                                                ),
                                              ],
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
                     //button layoout
                     OrderTrackWidget().orderTrackButtonLayout(
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
