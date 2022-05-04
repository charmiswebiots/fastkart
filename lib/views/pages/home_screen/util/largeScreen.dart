import 'dart:io';

import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/home_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/banner_list.dart';
import 'package:fastkart/views/pages/home_screen/offer_list.dart';
import 'package:fastkart/views/pages/home_screen/recentBought_list.dart';
import 'package:fastkart/views/pages/home_screen/shop_by_category.dart';
import 'package:fastkart/views/pages/home_screen/util/home_constants.dart';
import 'package:fastkart/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:fastkart/views/pages/home_screen/util/home_widget.dart';
import 'package:fastkart/widgets/common_appbar_widget/common_appbar.dart';
import 'package:flutter/material.dart';

class HomeLagreScreen extends StatefulWidget {

  HomeLagreScreen({Key? key}) : super(key: key);

  @override
  State<HomeLagreScreen> createState() => _HomeLagreScreenState();
}

class _HomeLagreScreenState extends State<HomeLagreScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
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
                            AppScreenUtil().screenHeight(15),
                  ),
                  child: Column(
                    children: [
                      //common app bar

                      //search textformfield layout
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppScreenUtil().screenHeight(15),
                            right: AppScreenUtil().screenHeight(15)),
                        child: HomeWidget().textFieldLayout(
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
                            child: Image.asset(iconAssets.voice,fit: BoxFit.contain,color: appCtrl.appTheme.titleColor     ,height: AppScreenUtil().screenHeight(10),width: AppScreenUtil().screenWidth(10),),
                          ),
                          prefixIcon: Image.asset(iconAssets.textboxSearchIcon,color: appCtrl.appTheme.titleColor,),
                          text: HomeFont().searchProduct,
                          borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                          hintColor: appCtrl.appTheme.contentColor,
                          fillcolor: appCtrl.appTheme.textBoxColor,
                        ),
                      ),
                      Space(0, 20),

                      //Banner
                      BannerList(onTap: () => Get.toNamed(routeName.shopScreen),),
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
                      Space(0, 5),

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
                        isBigScreen: true,
                      ),
                      Space(0, 10),

                      //offer list widget
                      HomeWidget().offerListAndContentWidget(
                          context: context,
                          isBigScreen: true,
                          containerColor: appCtrl.appTheme.offerBoxColor,
                          seeAllColor: appCtrl.appTheme.primary,
                          descriptionColor: appCtrl.appTheme.darkContentColor,
                        child: Column(
                          children: [
                            //offer list
                            ...homeCtrl.offerList.map((e) {
                              return OfferListCard(
                                data: e,
                              );
                            }).toList(),
                          ],
                        )),

                      Space(0, 20),

                      //lowest price and everyday essential layout

                      HomeWidget().lowestPriceAndEveryDayEssentialWidget(
                          isBigScreen: true,
                          containerColor: appCtrl.appTheme.whiteColor,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //lowest price layout
                              HomeWidget().commonHorizontalListLayout(
                                  isBigScreen: true,
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
                              Space(0, 10),
                              //Everyday Essentials layout
                              HomeWidget().commonHorizontalListLayout(
                                  isBigScreen: true,
                                  context: context,
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
                      Space(0, 30),

                      //lowest price and browse category button
                      HomeWidget().lowestPriceAndBrowseCategorylWidget(
                          isBigScreen: true,
                          containerColor: appCtrl.appTheme.whiteColor,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //lowest price layout
                              HomeWidget().commonHorizontalListLayout(
                                  isBigScreen: true,
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
                              Space(0, 10),

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

            ],
          ),
        );
      }
    );
  }
}
