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
            Container(
              margin: EdgeInsets.only(
                top: Platform.isIOS
                    ? MediaQuery.of(context).size.height /
                        AppScreenUtil().screenHeight(15)
                    : MediaQuery.of(context).size.height /
                        AppScreenUtil().screenHeight(20),
              ),
              child: SingleChildScrollView(
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
                      height: 500,
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

                         /* Container(
                            width: MediaQuery.of(context).size.width,
                            child:Column(
                              children: [
                                ...AppArray().offerList.map((e) {
                                  return Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: AppScreenUtil().screenWidth(15),bottom: AppScreenUtil().size(10)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppScreenUtil().size(12),
                                            horizontal: AppScreenUtil().size(15)),
                                        decoration: BoxDecoration(
                                            color: appCtrl.appTheme.whiteColor,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                e['image'].toString(),
                                                fit: BoxFit.fill,
                                                height: AppScreenUtil().size(45),
                                                width: AppScreenUtil().size(45),
                                              ),
                                              Space(15, 0),
                                              VerticalDivider(
                                                color: appCtrl.appTheme.contentColor.withOpacity(.5),
                                                width: 5,
                                                thickness: 1,
                                              ),
                                              Space(15, 0),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  HomeFontStyle().mulishtextLayout(
                                                      text: e['name'],
                                                      fontSize: 13,
                                                      color: appCtrl.appTheme.titleColor
                                                  ),
                                                  Space(0, 5),
                                                  HomeFontStyle().mulishtextLayout(
                                                      text: e['description'],
                                                      fontSize: 13,
                                                      color: appCtrl.appTheme.darkContentColor
                                                  ),
                                                  Space(0, 5),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          HomeFontStyle().mulishtextLayout(
                                                              text: HomeFont().dollar +  e['price'].toString(),
                                                              fontSize: 12,
                                                              color: appCtrl.appTheme.titleColor,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: appCtrl.appTheme.primary,
                                                                borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            margin: EdgeInsets.only(left: AppScreenUtil().screenHeight(5)),
                                                            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(12),vertical: AppScreenUtil().screenHeight(5)),
                                                            child:  HomeFontStyle().mulishtextLayout(
                                                              text: e['discount'].toString(),
                                                              fontSize: 2,
                                                              color: appCtrl.appTheme.whiteColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Space(10,0),
                                                      Container(
                                                        padding : EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(8),horizontal: AppScreenUtil().screenWidth(8)),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                                                          border: Border.all(color: appCtrl.appTheme.lightPrimary)
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.remove,size: 18,),
                                                            Space(10,0),
                                                            Text('1'),
                                                            Space(10,0),
                                                            Icon(Icons.add,size: 18),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          )*/
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
