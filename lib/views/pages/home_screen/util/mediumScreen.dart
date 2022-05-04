import 'dart:io';

import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/banner_list.dart';
import 'package:fastkart/views/pages/home_screen/offer_list.dart';
import 'package:fastkart/views/pages/home_screen/recentBought_list.dart';
import 'package:fastkart/views/pages/home_screen/shop_by_category.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_widget.dart';
import 'package:fastkart/widgets/common_appbar_widget/common_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/home_controller.dart';

class HomeMediumScreen extends StatefulWidget {
  HomeMediumScreen({Key? key}) : super(key: key);

  @override
  State<HomeMediumScreen> createState() => _HomeMediumScreenState();
}

class _HomeMediumScreenState extends State<HomeMediumScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (_) => GetBuilder<HomeController>(builder: (cntx) {
        return Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  //search textformfield layout
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenHeight(15),
                        right: AppScreenUtil().screenHeight(15)),
                    child: HomeWidget().textFieldLayout(
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().screenHeight(10)),
                        child: Image.asset(
                          iconAssets.voice,
                          fit: BoxFit.contain,
                          color: appCtrl.appTheme.titleColor,
                          height: AppScreenUtil().screenHeight(10),
                          width: AppScreenUtil().screenWidth(10),
                        ),
                      ),
                      prefixIcon: Image.asset(
                        iconAssets.textboxSearchIcon,
                        color: appCtrl.appTheme.titleColor,
                      ),
                      text: HomeFont().searchProduct,
                      borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                      hintColor: appCtrl.appTheme.contentColor,
                      fillcolor: appCtrl.appTheme.textBoxColor,
                    ),
                  ),
                  Space(0, 20),

                  //Banner
                  BannerList(
                    onTap: () => Get.toNamed(routeName.shopScreen),
                  ),
                  Space(0, 20),
                  //recent bought widget
                  RecentBoughtList(
                    isTheme: appCtrl.isTheme,
                    containercolor: appCtrl.appTheme.lightPrimary,
                    bordercolor: appCtrl.appTheme.recentBGColor,
                    titlecolor: appCtrl.appTheme.titleColor,
                    title: HomeFont().recentBought,
                    list: AppArray().recentBoughtList,
                    listcontainercolor: appCtrl.appTheme.whiteColor,
                    themeColor: appCtrl.appTheme.whiteColor,
                  ),
                  Space(0, 10),

                  //recent bought widget
                  HomeWidget().shopByCategoryText(
                      bordercolor: appCtrl.appTheme.greyBGColor,
                      title: HomeFont().shopByCategory,
                      titlecolor: appCtrl.appTheme.titleColor,
                      context: context),
                  Space(0, 10),
                  //shop by category list
                  ShopByCategory(
                    fontColor: appCtrl.appTheme.titleColor,
                    isBigScreen: false,
                  ),
                  Space(0, 20),

                  //offer list widget
                  HomeWidget().offerListAndContentWidget(
                      context: context,
                      textColor: appCtrl.appTheme.titleColor,
                      isBigScreen: false,
                      containerColor: appCtrl.appTheme.offerBoxColor,
                      seeAllColor: appCtrl.appTheme.primary,
                      descriptionColor: appCtrl.appTheme.darkContentColor,
                      child: Column(
                        children: [
                          //offer list
                          ...homeCtrl.offerList.asMap().entries.map((e) {
                            return OfferListCard(
                              data: e.value,
                              minusTap: () => homeCtrl.minusTap(e.key),
                              plusTap: () => homeCtrl.plusTap(e.key),
                            );
                          }).toList(),
                        ],
                      )),
                  Space(0, 20),

                  //lowest price and everyday essential layout

                  HomeWidget().lowestPriceAndEveryDayEssentialWidget(
                      isBigScreen: false,
                      containerColor: appCtrl.appTheme.whiteColor,
                      context: context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lowest price layout
                          HomeWidget().commonHorizontalListLayout(
                              isBigScreen: false,
                              context: context,
                              boxColor: appCtrl.appTheme.whiteColor,
                              title: HomeFont().lowestPrice,
                              seeAllText: HomeFont().seeAll,
                              data: AppArray().lowerPriceList,
                              shadowColor: appCtrl.appTheme.contentColor,
                              lowestPriceColor: appCtrl.appTheme.primary,
                              payLessColor: appCtrl.appTheme.darkContentColor,
                              descriptionColor:
                                  appCtrl.appTheme.darkContentColor,
                              containerBorderColor:
                                  appCtrl.appTheme.greyBGColor,
                              iconColor: appCtrl.appTheme.whiteColor,
                              priceColor: appCtrl.appTheme.titleColor,
                              primaryColor: appCtrl.appTheme.primary),
                          Space(0, 20),
                          //Everyday Essentials layout
                          HomeWidget().commonHorizontalListLayout(
                              isBigScreen: false,
                              context: context,
                              boxColor: appCtrl.appTheme.whiteColor,
                              title: HomeFont().everydayEssentials,
                              seeAllText: HomeFont().seeAll,
                              data: AppArray().everyDayEssentialList,
                              shadowColor: appCtrl.appTheme.contentColor,
                              lowestPriceColor: appCtrl.appTheme.primary,
                              payLessColor: appCtrl.appTheme.darkContentColor,
                              descriptionColor:
                                  appCtrl.appTheme.darkContentColor,
                              containerBorderColor:
                                  appCtrl.appTheme.greyBGColor,
                              iconColor: appCtrl.appTheme.whiteColor,
                              priceColor: appCtrl.appTheme.titleColor,
                              primaryColor: appCtrl.appTheme.primary),
                        ],
                      )),

                  //coupons layout
                  HomeWidget().couponsWidget(
                      context: context,
                      isTheme: appCtrl.isTheme,
                      titleColor: appCtrl.appTheme.bannerTitleColor,
                      containerColor: appCtrl.appTheme.couponBoxColor,
                      primaryColor: appCtrl.appTheme.couponBoxColor,
                      descriptionColor: appCtrl.appTheme.darkContentColor,
                      seeAllColor: appCtrl.appTheme.primary,
                      dottedLineColor: appCtrl.appTheme.couponBoxColor,
                      decriptionColor: appCtrl.appTheme.darkContentColor),
                  Space(0, 20),

                  //lowest price and browse category layout
                  HomeWidget().lowestPriceAndBrowseCategorylWidget(
                      isBigScreen: false,
                      containerColor: appCtrl.appTheme.whiteColor,
                      context: context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lowest price layout
                          HomeWidget().commonHorizontalListLayout(
                              isBigScreen: false,
                              context: context,
                              boxColor: appCtrl.appTheme.whiteColor,
                              title: HomeFont().lowestPrice,
                              seeAllText: HomeFont().seeAll,
                              data: AppArray().lowerPriceList,
                              shadowColor: appCtrl.appTheme.contentColor,
                              lowestPriceColor: appCtrl.appTheme.primary,
                              payLessColor: appCtrl.appTheme.darkContentColor,
                              descriptionColor:
                                  appCtrl.appTheme.darkContentColor,
                              containerBorderColor:
                                  appCtrl.appTheme.greyBGColor,
                              iconColor: appCtrl.appTheme.whiteColor,
                              priceColor: appCtrl.appTheme.titleColor,
                              primaryColor: appCtrl.appTheme.primary),
                          Space(0, 20),

                          //didn't find what you were looking for text
                          HomeWidget().didntFindWhatLookingForLayout(
                              fontColor: appCtrl.appTheme.contentColor,
                              text: HomeFont().didntFindWhatYouWereLookingFor),
                          Space(0, 10),

                          //browse category button layout
                          HomeWidget().browseCategoryButtonLayout(
                              buttonColor: appCtrl.appTheme.primary,
                              textColor: appCtrl.appTheme.whiteColor,
                              onTap: () {})
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
