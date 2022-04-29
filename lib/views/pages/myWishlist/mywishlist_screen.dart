import 'package:fastkart/controllers/mywishlist_controller.dart';
import 'package:fastkart/views/pages/myWishlist/myWishListCard.dart';
import 'package:fastkart/views/pages/myWishlist/util/mywishlist_constants.dart';
import 'package:fastkart/views/pages/myWishlist/util/mywishlist_widget.dart';
import 'package:fastkart/views/pages/search/trendingProductCard.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class MyWishListScreen extends StatefulWidget {
  const MyWishListScreen({Key? key}) : super(key: key);

  @override
  State<MyWishListScreen> createState() => _MyWishListScreenState();
}

class _MyWishListScreenState extends State<MyWishListScreen> {
  var wishListCtrl = Get.put(MyWishListController());

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => AppComponent(
        child: Scaffold(
          backgroundColor: wishListCtrl.appCtrl.appTheme.whiteColor,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: GetBuilder<MyWishListController>(
              builder: (_) => SingleChildScrollView(
                child: Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //search product textformfield layout
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppScreenUtil().screenHeight(15),
                                    right: AppScreenUtil().screenHeight(15)),
                                child: MyWishlistWidget().textFieldLayout(
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            AppScreenUtil().screenHeight(10)),
                                    child: Image.asset(
                                      iconAssets.voice,
                                      fit: BoxFit.contain,
                                      color: wishListCtrl
                                          .appCtrl.appTheme.titleColor,
                                      height: AppScreenUtil().screenHeight(10),
                                      width: AppScreenUtil().screenWidth(10),
                                    ),
                                  ),
                                  prefixIcon: Image.asset(
                                    iconAssets.textboxSearchIcon,
                                    color: wishListCtrl
                                        .appCtrl.appTheme.titleColor,
                                  ),
                                  text: MyWishListFont().searchProduct,
                                  borderColor: wishListCtrl
                                      .appCtrl.appTheme.primary
                                      .withOpacity(.3),
                                  hintColor: wishListCtrl
                                      .appCtrl.appTheme.contentColor,
                                  fillcolor: wishListCtrl
                                      .appCtrl.appTheme.textBoxColor,
                                ),
                              ),
                              Space(0, 20),

                              // wish list layout
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(10),
                                    left: AppScreenUtil().screenHeight(15),
                                    right: AppScreenUtil().screenHeight(15)),
                                child: ListView.builder(
                                  itemCount: wishListCtrl.offerList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    final item = wishListCtrl.offerList[index];
                                    return Slidable(
                                      endActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: wishListCtrl
                                                    .appCtrl.appTheme.redColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        AppScreenUtil()
                                                            .borderRadius(10)),
                                                    bottomRight:
                                                        Radius.circular(
                                                            AppScreenUtil()
                                                                .borderRadius(
                                                                    10))),
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
                                            ),
                                          )
                                        ],
                                      ),

                                      // The child of the Slidable is what the user sees when the
                                      // component is not dragged.
                                      child: MyWishListCard(
                                        data: wishListCtrl.offerList[index],
                                        containerboxColor: wishListCtrl
                                            .appCtrl.appTheme.wishtListBoxColor,
                                        descriptionColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        discountBoxColor: wishListCtrl
                                            .appCtrl.appTheme.primary,
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
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
