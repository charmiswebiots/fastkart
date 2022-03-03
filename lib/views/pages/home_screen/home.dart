import 'dart:io';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/banner_list.dart';
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
                    HomeWidget().recentBoughtListWiget(
                      context: context,
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
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 30,
                          left: AppScreenUtil().screenHeight(15),
                          right: AppScreenUtil().screenHeight(15)),
                      color: appCtrl.appTheme.lightPrimary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeFontStyle().mulishtextLayout(
                                  text: HomeFont().sayHelloToOffer,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                              HomeFontStyle().mulishtextLayout(
                                  text: HomeFont().seeAll,
                                  fontSize: 12,
                                  color: appCtrl.appTheme.primary),
                            ],
                          ),
                          HomeFontStyle().mulishtextLayout(
                              text: HomeFont().bestPriceEverOfAllTheTime,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: appCtrl.appTheme.darkContentColor),

                          Space(0, 10),
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: AppArray().offerList.length,
                              itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: appCtrl.appTheme.whiteColor,
                                  borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(10))
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(AppArray().offerList[index]['image'].toString())
                                  ],
                                ),
                              );
                            },),
                          )
                        ],
                      ),
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
