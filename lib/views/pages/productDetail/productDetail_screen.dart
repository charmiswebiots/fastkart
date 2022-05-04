import 'dart:ffi';

import 'package:fastkart/controllers/productdetail_controller.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:fastkart/views/pages/productDetail/bannerLayout.dart';
import 'package:fastkart/views/pages/productDetail/reviewCard.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_constants.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_fontstyle.dart';
import 'package:fastkart/views/pages/productDetail/util/productDetail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var productDetailCtrl = Get.put(ProductDetailController());



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return GetBuilder<AppController>(
      builder: (ctrl) => Scaffold(
        backgroundColor: productDetailCtrl.appCtrl.appTheme.wishtListBoxColor,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: productDetailCtrl.appCtrl.appTheme.wishtListBoxColor,

          leading: ProductDetailWidget().appBarLeadingLayput(
              onTap: () => Get.back(),
              borderColor: productDetailCtrl.appCtrl.appTheme.titleColor,
              iconColor: productDetailCtrl.appCtrl.appTheme.titleColor,
              image: productDetailCtrl.appCtrl.isTheme
                  ? imageAssets.themeFkLogo
                  : imageAssets.fkLogo),
          actions: [
            ProductDetailWidget().appBarActionLayout(
              iconColor: productDetailCtrl.appCtrl.appTheme.titleColor,
            ),
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: GetBuilder<ProductDetailController>(
            builder: (_) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          //banner layout
                          BannerLayout(
                            BGcolor: productDetailCtrl
                                .appCtrl.appTheme.wishtListBoxColor,
                            activeDotColor:
                                productDetailCtrl.appCtrl.appTheme.primary,
                            dotColor: productDetailCtrl.appCtrl.appTheme.primary,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
                            decoration: BoxDecoration(
                                color:
                                    productDetailCtrl.appCtrl.appTheme.whiteColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        AppScreenUtil().borderRadius(20)),
                                    topLeft: Radius.circular(
                                        AppScreenUtil().borderRadius(20)))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //product name layout
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                  child: ProductDetailFontStyle().mulishtextLayout(
                                      text:
                                          'Assorted Capsicum Combo-  (Red, Yellow, Green)',
                                      fontSize: ProductDetailFontSize.textSizeSMedium,
                                      fontWeight: FontWeight.w800,
                                      overflow: TextOverflow.clip),
                                ),

                                //rating layout
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                  child: Row(
                                    children: [
                                      ProductDetailWidget().ratingLayout(
                                          glowColor: productDetailCtrl
                                              .appCtrl.appTheme.primary,
                                          unratedColor: productDetailCtrl
                                              .appCtrl.appTheme.contentColor,
                                          ratingColor: productDetailCtrl
                                              .appCtrl.appTheme.ratingColor,
                                          value: productDetailCtrl.rating,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          }),
                                      Space(5, 0),
                                      ProductDetailFontStyle().mulishtextLayout(
                                          text: '(150 Ratings)',
                                          fontSize: ProductDetailFontSize.textSizeSmall,
                                          color: productDetailCtrl
                                              .appCtrl.appTheme.darkContentColor,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.clip),
                                    ],
                                  ),
                                ),
                                //price layout
                                ProductDetailWidget().priceLayout(
                                    dicountPric: '25.00',
                                    discountPriceColor: productDetailCtrl
                                        .appCtrl.appTheme.titleColor,
                                    totalPrice: '45.00',
                                    totalPriceColor: productDetailCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    discountText: '25% off',
                                    discountTextColor:
                                        productDetailCtrl.appCtrl.appTheme.primary),

                                Space(0, 15),
                                // select quantity and delivery time
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ProductDetailWidget().commonLayoyt(
                                            textColor: productDetailCtrl
                                                .appCtrl.appTheme.titleColor,
                                            text:
                                                productDetailCtrl.selectedQuantity,
                                            containerColor: productDetailCtrl
                                                .appCtrl.appTheme.wishtListBoxColor,
                                            onTap: () => productDetailCtrl
                                                .quantityBottomSheet(
                                                    context: context)),
                                      ),
                                      Space(10, 0),
                                      Expanded(
                                        child: ProductDetailWidget().commonLayoyt(
                                            textColor: productDetailCtrl
                                                .appCtrl.appTheme.titleColor,
                                            text: productDetailCtrl
                                                .selectedDeliveryTime,
                                            containerColor: productDetailCtrl
                                                .appCtrl.appTheme.wishtListBoxColor,
                                            onTap: () => productDetailCtrl
                                                .deliveryBottomSheet(
                                                    context: context)),
                                      ),
                                    ],
                                  ),
                                ),
                                Space(0, 15),
                                //detail layout
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                  height: AppScreenUtil().screenHeight( productDetailCtrl.isShow? 300: 220),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(dividerColor: Colors.transparent),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          ProductDetailWidget().detailListLayout(
                                              data: productDetailCtrl
                                                  .detailList[index],
                                              context: context,
                                              isShow: productDetailCtrl.isShow,
                                              textColor: productDetailCtrl
                                                  .appCtrl.appTheme.titleColor,
                                              dividerColor: productDetailCtrl
                                                  .appCtrl.appTheme.contentColor.withOpacity(.6),
                                              onExpansionChanged: (bool expanded) {
                                                productDetailCtrl.detailList[index]
                                                    ['isShow'] = expanded;
                                                productDetailCtrl.isShow = !productDetailCtrl.isShow;
                                                productDetailCtrl.update();
                                              }),
                                      //  DataPopUp(AppArray().detailList[index]),
                                      itemCount:
                                          productDetailCtrl.detailList.length,
                                    ),
                                  ),
                                ),

                                //product review count and see All text
                                ProductDetailWidget().reviewCountAndSeeAll(
                                    text: 'Product Review(15)',
                                    onTap: () => productDetailCtrl
                                        .reviewListBottomSheet(context: context),
                                    seeAll: ProductDetailFont().seeAll,
                                    textColor: productDetailCtrl
                                        .appCtrl.appTheme.titleColor,
                                    seeAllColor:
                                        productDetailCtrl.appCtrl.appTheme.primary),

                                Space(0, 20),
                                //reviewList layout
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                                  height: AppScreenUtil().screenHeight(320),
                                  child: ListView.builder(
                                    itemCount: 2,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return ReviewCard(
                                        data: productDetailCtrl.reviewList[index],
                                        glowColor: productDetailCtrl
                                            .appCtrl.appTheme.primary,
                                        unratedColor: productDetailCtrl
                                            .appCtrl.appTheme.contentColor,
                                        ratingColor: productDetailCtrl
                                            .appCtrl.appTheme.ratingColor,
                                        color: productDetailCtrl
                                            .appCtrl.appTheme.wishtListBoxColor,
                                        descColor: productDetailCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        nameColor: productDetailCtrl
                                            .appCtrl.appTheme.titleColor,
                                      );
                                    },
                                  ),
                                ),
                                Space(0, 20),

                                //lowest price
                                ProductDetailWidget().lowestPrice(
                                  isBigScreen: true,
                                  containerColor: productDetailCtrl
                                      .appCtrl.appTheme.lowestBgColor,
                                  context: context,
                                  child: ProductDetailWidget().commonHorizontalListLayout(
                                      isBigScreen: true,
                                      context: context,
                                      title: ProductDetailFont().lowestPrice,
                                      seeAllText: ProductDetailFont().seeAll,
                                      data: AppArray().lowerPriceList,
                                      shadowColor: productDetailCtrl
                                          .appCtrl.appTheme.contentColor,
                                      lowestPriceColor: productDetailCtrl
                                          .appCtrl.appTheme.primary,
                                      payLessColor: productDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      descriptionColor: productDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      boxColor: productDetailCtrl
                                          .appCtrl.appTheme.whiteColor,
                                      containerBorderColor: productDetailCtrl
                                          .appCtrl.appTheme.greyBGColor,
                                      iconColor: productDetailCtrl
                                          .appCtrl.appTheme.whiteColor,
                                      priceColor: productDetailCtrl
                                          .appCtrl.appTheme.titleColor,
                                      primaryColor: productDetailCtrl
                                          .appCtrl.appTheme.primary),
                                ),
                                Space(0, 50),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ProductDetailWidget().amountButtonLayout(
                    context: context,
                      quantityColor:  productDetailCtrl.appCtrl.appTheme.titleColor,
                      plusTap: () => productDetailCtrl.increaseQuantity(),
                      minusTap: () => productDetailCtrl.decreaseQuantity(),
                      onTap: (){
                        Get.toNamed(routeName.myCart,arguments: true);
                      },
                      buttonColor: productDetailCtrl.appCtrl.appTheme.primary,
                    quantity: productDetailCtrl.quantity,
                    itemColor: productDetailCtrl.appCtrl.appTheme.white,qunatityBoxColor: productDetailCtrl.appCtrl.appTheme.whiteColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
