import 'dart:io';
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
import 'package:fastkart/config.dart';

class HomeLayout extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    const ShopByCategory(),
                    Space(0, 25),

                    //offer list widget
                    HomeWidget().offerListAndContentWidget(
                        context: context,
                        containerColor: appCtrl.appTheme.lightPrimary,
                        seeAllColor: appCtrl.appTheme.primary,
                        descriptionColor: appCtrl.appTheme.darkContentColor),
                    Space(0, 20),
                    Container(
                      color: appCtrl.appTheme.whiteColor,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 85 / 100,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lowest price layout
                          HomeWidget().commonHorizontalListLayout(
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
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 70/100,
                      width: MediaQuery.of(context).size.width,
                      color: appCtrl.appTheme.lightPrimary,
                      padding:
                      EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: 10),

                    )
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
      ),
    );
  }
}
