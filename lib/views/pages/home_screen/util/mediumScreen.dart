import 'dart:io';

import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/banner_list.dart';
import 'package:fastkart/views/pages/home_screen/recentBought_list.dart';
import 'package:fastkart/views/pages/home_screen/shop_by_category.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_widget.dart';
import 'package:fastkart/widgets/common_appbar_widget/common_appbar.dart';
import 'package:flutter/material.dart';

class HomeMediumScreen extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  HomeMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: Platform.isIOS
                    ? MediaQuery.of(context).size.height /
                        AppScreenUtil().screenHeight(15)
                    : MediaQuery.of(context).size.height /
                        AppScreenUtil().screenHeight(20),
              ),
              child: Column(
                children: [
                  //common app bar
                  CommonAppBar1(
                    onTap: () {},
                  ),
                  Space(0, 10),

                  //fullname textformfiel layout
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenHeight(15),
                        right: AppScreenUtil().screenHeight(15)),
                    child: HomeWidget().textFieldLayout(
                      suffixIcon: Image.asset(iconAssets.voice),
                      prefixIcon: Image.asset(iconAssets.textboxSearchIcon),
                      text: HomeFont().searchProduct,
                      borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                      hintColor: appCtrl.appTheme.contentColor,
                      fillcolor: appCtrl.appTheme.lightGray,
                    ),
                  ),
                  Space(0, 20),

                  //Banner
                  BannerList(),
                  Space(0, 20),
                  //recent bought widget
                  RecentBoughtList(
                    containercolor: appCtrl.appTheme.lightPrimary,
                    bordercolor: appCtrl.appTheme.recentBGColor,
                    titlecolor: appCtrl.appTheme.titleColor,
                    title: HomeFont().recentBought,
                    list: AppArray().recentBoughtList,
                    listcontainercolor: appCtrl.appTheme.whiteColor,
                  ),
                  Space(0, 25),

                  //recent bought widget
                  HomeWidget().shopByCategoryText(
                      bordercolor: appCtrl.appTheme.greyBGColor,
                      title: HomeFont().shopByCategory,
                      titlecolor: appCtrl.appTheme.titleColor,
                      context: context),

                  //shop by category list
                  ShopByCategory(
                    fontColor: appCtrl.appTheme.titleColor,
                    isBigScreen: false,
                  ),
                  Space(0, 25),

                  //offer list widget
                  HomeWidget().offerListAndContentWidget(
                      context: context,
                      isBigScreen:false,
                      containerColor: appCtrl.appTheme.lightPrimary,
                      seeAllColor: appCtrl.appTheme.primary,
                      descriptionColor: appCtrl.appTheme.darkContentColor),
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
                              title: HomeFont().everydayEssentials,
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
                        ],
                      )),

                  //coupons layout
                  HomeWidget().couponsWidget(
                      context: context,
                      containerColor: appCtrl.appTheme.lightPrimary,
                      primaryColor: appCtrl.appTheme.lightPrimary,
                      descriptionColor: appCtrl.appTheme.darkContentColor,
                      seeAllColor: appCtrl.appTheme.primary,
                      dottedLineColor: appCtrl.appTheme.greyBGColor,
                      decriptionColor: appCtrl.appTheme.darkContentColor),
                  Space(0, 30),

                  //lowest price and browse category layout
                  HomeWidget().lowestPriceAndBrowseCategorylWidget(
                      isBigScreen:false,
                      containerColor: appCtrl.appTheme.whiteColor,
                      context: context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lowest price layout
                          HomeWidget().commonHorizontalListLayout(
                              isBigScreen: false,
                              context: context,
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
          BottomNavigatorCard(
            selectedIndex: 0,
            onTap: (val) {},
          )
        ],
      ),
    );
  }
}
