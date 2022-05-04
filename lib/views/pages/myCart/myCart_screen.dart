import 'package:fastkart/controllers/mycart_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/myCart/myCartCard.dart';
import 'package:fastkart/views/pages/myCart/offerUICard.dart';
import 'package:fastkart/views/pages/myCart/util/myCart_fontstyle.dart';
import 'package:fastkart/views/pages/myCart/util/myCart_widget.dart';
import 'package:fastkart/views/pages/myCart/util/myCart_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class MyCartListScreen extends StatefulWidget {
  const MyCartListScreen({Key? key}) : super(key: key);

  @override
  State<MyCartListScreen> createState() => _MyCartListScreenState();
}

class _MyCartListScreenState extends State<MyCartListScreen> {
  var wishListCtrl = Get.put(MyCartListController());

  void doNothing(BuildContext context) {}

  @override
  void initState() {
    // TODO: implement initState
    print(Get.arguments);
    wishListCtrl.isAppBar = Get.arguments ?? false;
    wishListCtrl.update();
    print(wishListCtrl.isAppBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<MyCartListController>(builder: (_) {
        return AppComponent(
          child: Scaffold(
            appBar: wishListCtrl.isAppBar
                ? MyCartWidget().appBarLayout(
                    backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
                    onTap: () async {
                      print('tap');
                      if (wishListCtrl.isAppBar) {
                        Get.back();
                      } else {
                        await wishListCtrl.appCtrl.getStorage
                            .write('selectedIndex', 0);
                        wishListCtrl.appCtrl.selectedIndex = 0;
                        wishListCtrl.appCtrl.update();
                      }
                    },titleColor: wishListCtrl.appCtrl.appTheme.titleColor,image: wishListCtrl.appCtrl.isTheme
                ? imageAssets.themeFkLogo
                : imageAssets.fkLogo,darkContentColor: wishListCtrl.appCtrl.appTheme.darkContentColor)
                : PreferredSize(
                    preferredSize:
                        Size.fromHeight(AppScreenUtil().screenHeight(65)),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height /
                            AppScreenUtil().screenHeight(18),
                      ),
                      child: MyCartWidget().appBarLayout(
                          backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
                          onTap: () async {
                            print('tap');
                            if (wishListCtrl.isAppBar) {
                              Get.back();
                            } else {
                              await wishListCtrl.appCtrl.getStorage
                                  .write('selectedIndex', 0);
                              wishListCtrl.appCtrl.selectedIndex = 0;
                              wishListCtrl.appCtrl.update();
                            }
                          },titleColor: wishListCtrl.appCtrl.appTheme.titleColor,image: wishListCtrl.appCtrl.isTheme
                          ? imageAssets.themeFkLogo
                          : imageAssets.fkLogo,darkContentColor: wishListCtrl.appCtrl.appTheme.darkContentColor),
                    ),
                  ),
            backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(

                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // wish list layout
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  left: AppScreenUtil().screenHeight(15),
                                  right: AppScreenUtil().screenHeight(15)),
                              child: ListView.builder(
                                itemCount: wishListCtrl.offerList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.32,
                                      motion: ScrollMotion(),
                                      children: [
                                        Container(
                                          width:
                                              AppScreenUtil().screenWidth(100),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: wishListCtrl
                                                .appCtrl.appTheme.primary,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    AppScreenUtil()
                                                        .borderRadius(10)),
                                                bottomRight: Radius.circular(
                                                    AppScreenUtil()
                                                        .borderRadius(10))),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            vertical: AppScreenUtil()
                                                .screenHeight(10),
                                          ),
                                          child: GestureDetector(
                                            onTap: () => {},
                                            child: Image.asset(
                                              iconAssets.delete,
                                              height: AppScreenUtil()
                                                  .screenHeight(20),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),

                                    // The child of the Slidable is what the user sees when the
                                    // component is not dragged.
                                    child: MyCartCard(
                                      data: wishListCtrl.offerList[index],
                                      containerboxColor: wishListCtrl
                                          .appCtrl.appTheme.wishtListBoxColor,
                                      descriptionColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      discountBoxColor:
                                          wishListCtrl.appCtrl.appTheme.primary,
                                      discountTextColor: wishListCtrl
                                          .appCtrl.appTheme.whiteColor,
                                      dividerColor: wishListCtrl
                                          .appCtrl.appTheme.contentColor
                                          .withOpacity(.5),
                                      quantityBorderColor: wishListCtrl
                                          .appCtrl.appTheme.lightPrimary,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.titleColor,
                                      plusTap: () =>
                                          wishListCtrl.plusTap(index),
                                      minusTap: () =>
                                          wishListCtrl.minusTap(index),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //offer ui card
                            OfferUICard(
                              isTheme: wishListCtrl.appCtrl.isTheme,
                              discountColor:
                                  wishListCtrl.appCtrl.appTheme.primary,
                              titleColor:
                                  wishListCtrl.appCtrl.appTheme.titleColor,
                              darkContentColor: wishListCtrl
                                  .appCtrl.appTheme.darkContentColor,
                              whiteColor:
                                  wishListCtrl.appCtrl.appTheme.whiteColor,
                            ),
                            Space(0, 5),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenHeight(20)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyCartFontStyle().mulishtextLayout(
                                      text: MyCartFont().orderDetails,
                                      color: wishListCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize: MyCartFontSize.textSizeMedium,
                                      fontWeight: FontWeight.w600),
                                  Space(0, 15),
                                  MyCartWidget().commonPriceDetail(
                                      title: MyCartFont().bagTotal,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: MyCartFont().dollar + '220.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  Space(0, 10),
                                  MyCartWidget().commonPriceDetail(
                                      title: MyCartFont().bagSavings,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: '-${MyCartFont().dollar}20.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: wishListCtrl
                                          .appCtrl.appTheme.primary),
                                  Space(0, 10),
                                  MyCartWidget().commonPriceDetail(
                                      title: MyCartFont().couponDiscount,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: 'Apply Coupon',
                                      fontWeight: FontWeight.normal,
                                      valColor: wishListCtrl
                                          .appCtrl.appTheme.redColor),
                                  Space(0, 10),
                                  MyCartWidget().commonPriceDetail(
                                      title: MyCartFont().delivery,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      fontWeight: FontWeight.normal,
                                      val: MyCartFont().dollar + '50.00',
                                      valColor: wishListCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  Space(0, 10),
                                  Divider(),
                                  Space(0, 10),
                                  MyCartWidget().commonPriceDetail(
                                      title: MyCartFont().totalAmount,
                                      titleColor: wishListCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontWeight: FontWeight.w600,
                                      val: MyCartFont().dollar + '270.00',
                                      valColor: wishListCtrl
                                          .appCtrl.appTheme.titleColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(routeName.addAddress),
                      child: Container(
                        height: AppScreenUtil().screenHeight(45),
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().screenHeight(12)),
                        margin: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenHeight(15)),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: wishListCtrl.appCtrl.appTheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: MyCartFontStyle().mulishtextLayout(
                            text: MyCartFont().proceedtoCheckout,
                            fontSize: 12,
                            color: wishListCtrl.appCtrl.appTheme.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
