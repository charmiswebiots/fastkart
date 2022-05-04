import 'package:fastkart/controllers/myWishList_controller.dart';
import 'package:fastkart/views/pages/myWishList/myWishListCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config.dart';

class MyWishListScreen extends StatelessWidget {
  var wishListCtrl = Get.put(MyWishListController());
   MyWishListScreen({Key? key}) : super(key: key);

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
              builder: (_) => Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                                  .appCtrl.appTheme.primary,
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
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
