import 'package:fastkart/controllers/shop_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/shop/shopListCard.dart';
import 'package:fastkart/views/pages/shop/util/shop_constants.dart';
import 'package:fastkart/views/pages/shop/util/shop_fontstyle.dart';
import 'package:fastkart/views/pages/shop/util/shop_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var shopCtrl = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<ShopController>(builder: (_) {
          return Scaffold(

            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: shopCtrl.appCtrl.appTheme.whiteColor,
              leadingWidth: AppScreenUtil().screenWidth(100),
              leading: ShopWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: shopCtrl.appCtrl.appTheme.titleColor,
                  iconColor: shopCtrl.appCtrl.appTheme.titleColor,
                  image: shopCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: ShopWidget().appBarTitleLayout(
                  text: "Fresh Fruits& Vegetables",
                  textColor: shopCtrl.appCtrl.appTheme.darkContentColor),
              actions: [
                ShopWidget().appBarActionLayout(),
              ],
            ),
            backgroundColor: shopCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: shopCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //category layout
                            ShopWidget().categoryLayout(
                              child: ListView.builder(
                                itemCount: AppArray().shopCategoryList.length,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: AppScreenUtil().screenWidth(12),
                                        left: AppScreenUtil()
                                            .screenWidth(index == 0 ? 15 : 0)),
                                    child: InkWell(
                                      onTap: () => shopCtrl.selectCategory(index,AppArray().shopCategoryList[index]
                                      ['id']),
                                      child: ShopFontStyle().mulishtextLayout(
                                          text: AppArray().shopCategoryList[index]
                                              ['title'].toString(),
                                          fontSize: ShopFontSize.textSizeSMedium,
                                          fontWeight: FontWeight.normal,
                                          color: shopCtrl.selectIndex == index
                                              ? shopCtrl.appCtrl.appTheme.primary
                                              : shopCtrl
                                                  .appCtrl.appTheme.titleColor),
                                    ),
                                  );
                                },
                              ),
                              context: context,
                              color: shopCtrl.appCtrl.appTheme.textBoxColor,
                            ),

                            //search product textformfield layout
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppScreenUtil().screenHeight(15),
                                  right: AppScreenUtil().screenHeight(15)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ShopWidget().textFieldLayout(
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                AppScreenUtil().screenHeight(10)),
                                        child: ShopWidget().voiceIcon(
                                            shopCtrl.appCtrl.appTheme.titleColor,
                                            iconAssets.voice),
                                      ),
                                      prefixIcon: Image.asset(
                                        iconAssets.textboxSearchIcon,
                                        color:
                                            shopCtrl.appCtrl.appTheme.titleColor,
                                      ),
                                      text: ShopFont().searchProduct,
                                      borderColor: shopCtrl
                                          .appCtrl.appTheme.primary
                                          .withOpacity(.3),
                                      hintColor:
                                          shopCtrl.appCtrl.appTheme.contentColor,
                                      fillcolor:
                                          shopCtrl.appCtrl.appTheme.textBoxColor,
                                    ),
                                  ),
                                  Space(15, 0),
                                  InkWell(
                                    onTap: () =>shopCtrl.bottomSheet(
                                        context: context,
                                        primaryColor: shopCtrl.appCtrl.appTheme.primary,

                                        categoryTextColor: shopCtrl.appCtrl.appTheme.titleColor,
                                        termConditionColor: shopCtrl.appCtrl.appTheme.darkContentColor,
                                        lightPrimary: shopCtrl.appCtrl
                                            .appTheme.white
                                            .withOpacity(.3)),
                                    child: ShopFontStyle().mulishtextLayout(
                                        text: ShopFont().filter,
                                        fontSize: 16,
                                        color: shopCtrl.appCtrl.appTheme.primary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),

                            //shop list
                            ShopWidget().shopLayout(
                                context: context,
                                child: ListView.builder(
                                  itemCount: shopCtrl.offerList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return ShopListCard(
                                      index: index,
                                      data: shopCtrl.offerList[index],
                                      containerboxColor: shopCtrl
                                          .appCtrl.appTheme.wishtListBoxColor,
                                      descriptionColor: shopCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      discountBoxColor:
                                          shopCtrl.appCtrl.appTheme.primary,
                                      discountTextColor:
                                          shopCtrl.appCtrl.appTheme.whiteColor,
                                      dividerColor: shopCtrl
                                          .appCtrl.appTheme.contentColor
                                          .withOpacity(.5),
                                      quantityBorderColor:
                                          shopCtrl.appCtrl.appTheme.lightPrimary,
                                      titleColor:
                                          shopCtrl.appCtrl.appTheme.titleColor,
                                      plusTap: () => shopCtrl.plusTap(index),
                                      minusTap: () => shopCtrl.minusTap(index),
                                    );
                                  },
                                )),
                            Space(0, 60),
                          ],
                        ),
                      ),
                    ),
                    ShopWidget().amountButtonLayout(
                        context: context,
                        buttonColor: shopCtrl.appCtrl.appTheme.primary,
                        itemColor: shopCtrl.appCtrl.appTheme.white)
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
