import 'package:fastkart/controllers/mywishlist_controller.dart';
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
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var wishListCtrl = Get.put(MyWishListController());
  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) => Scaffold(
      backgroundColor: appCtrl.appTheme.whiteColor,
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
                              text: MyWishListFont().searchProduct,
                              borderColor:
                              appCtrl.appTheme.primary.withOpacity(.3),
                              hintColor: appCtrl.appTheme.contentColor,
                              fillcolor: appCtrl.appTheme.textBoxColor,
                            ),
                          ),
                          Space(0, 20),
                          Container(
                            width: MediaQuery.of(context).size.width,

                            padding: EdgeInsets.only(
                                top: AppScreenUtil().screenHeight(10),
                                left: AppScreenUtil().screenHeight(15),
                                right: AppScreenUtil().screenHeight(15)),
                            child: ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                               /* return TrendingProductCard(
                                  data: wishListCtrl.offerList[index],
                                  containerboxColor: appCtrl.appTheme.wishtListBoxColor,
                                  descriptionColor:
                                  appCtrl.appTheme.darkContentColor,
                                  discountBoxColor: appCtrl.appTheme.primary,
                                  discountTextColor: appCtrl.appTheme.whiteColor,
                                  dividerColor:
                                  appCtrl.appTheme.contentColor.withOpacity(.5),
                                  quantityBorderColor:
                                  appCtrl.appTheme.lightPrimary,
                                  titleColor: appCtrl.appTheme.titleColor,
                                  plusTap: () => wishListCtrl.plusTap(index),
                                  minusTap: ()=> wishListCtrl.minusTap(index),
                                );*/
                                return Slidable(
                                  // Specify a key if the Slidable is dismissible.


                                  // The end action pane is the one at the right or the bottom side.
                                  endActionPane:  ActionPane(

                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(

                                        // An action can be bigger than the others.
                                        flex: 6,
                                        onPressed: doNothing,
                                        backgroundColor: appCtrl.appTheme.redColor  ,
                                        foregroundColor:  appCtrl.appTheme.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),

                                    ],
                                  ),

                                  // The child of the Slidable is what the user sees when the
                                  // component is not dragged.
                                  child: TrendingProductCard(
                                    data: wishListCtrl.offerList[index],
                                    containerboxColor: appCtrl.appTheme.wishtListBoxColor,
                                    descriptionColor:
                                    appCtrl.appTheme.darkContentColor,
                                    discountBoxColor: appCtrl.appTheme.primary,
                                    discountTextColor: appCtrl.appTheme.whiteColor,
                                    dividerColor:
                                    appCtrl.appTheme.contentColor.withOpacity(.5),
                                    quantityBorderColor:
                                    appCtrl.appTheme.lightPrimary,
                                    titleColor: appCtrl.appTheme.titleColor,
                                    plusTap: () => wishListCtrl.plusTap(index),
                                    minusTap: ()=> wishListCtrl.minusTap(index),
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
    ),);
  }
}
