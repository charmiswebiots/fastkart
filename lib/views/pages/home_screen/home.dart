import 'dart:io';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fastkart/views/pages/home_screen/banner_list.dart';
import 'package:fastkart/views/pages/home_screen/offer_list.dart';
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

                    //offerlist widget
                    Container(
                      height: AppScreenUtil().screenHeight(480),
                      width: MediaQuery.of(context).size.width,
                      color: appCtrl.appTheme.lightPrimary,
                      padding: EdgeInsets.symmetric(horizontal:AppScreenUtil().screenWidth(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //say hello and see all  widget
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppScreenUtil().screenHeight(30),
                            ),
                            child: HomeWidget().commonTitleAndSeeAllWidget(
                                title: HomeFont().sayHelloToOffer,
                                seeAllText: HomeFont().seeAll,
                                seeAllColor: appCtrl.appTheme.primary),
                          ),
                          //best price widget
                          HomeWidget().commonDescriptionTextWidget(
                              text: HomeFont().bestPriceEverOfAllTheTime,
                              color: appCtrl.appTheme.darkContentColor),
                          //offer list
                          ...AppArray().offerList.map((e) {
                            return OfferListCard(
                              data: e,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    Space(0, 20),
                    Container(
                      color: appCtrl.appTheme.whiteColor,
                      width: MediaQuery.of(context).size.width,
                      height: AppScreenUtil().screenHeight(500),
                      padding: EdgeInsets.symmetric(horizontal:AppScreenUtil().screenWidth(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lowest price and see all  widget
                          HomeWidget().commonTitleAndSeeAllWidget(
                              title :HomeFont().lowestPrice,
                            seeAllText:HomeFont().seeAll,
                            seeAllColor: appCtrl.appTheme.primary
                          ),

                          //popular offers of the day text widget
                          HomeWidget().commonDescriptionTextWidget(
                              text: HomeFont().payLessGetMore,
                              color: appCtrl.appTheme.darkContentColor),

                          //lowest price list
                          Container(
                            height: 300,
                            child: ListView.builder(
                              itemCount: AppArray().lowerPriceList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {

                              return Container(
                                padding: EdgeInsets.all(AppScreenUtil().size(10)),
                                margin: EdgeInsets.only(left: AppScreenUtil().size(index == 0 ? 0 :10,),top: AppScreenUtil().screenHeight(10),bottom: AppScreenUtil().screenHeight(10) ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: appCtrl.appTheme.contentColor),
                                  borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(10))
                                ),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                 // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(iconAssets.heart),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(AppArray().lowerPriceList[index]['image'].toString(),height: 50,width: 50,fit: BoxFit.fill,),
                                    ),

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
