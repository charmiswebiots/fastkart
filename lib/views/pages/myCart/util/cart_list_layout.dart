import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../config.dart';

class CartListLayout extends StatelessWidget {
  const CartListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<MyCartListController>(
          builder: (wishListCtrl) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenHeight(15),
                  right: AppScreenUtil().screenHeight(15)),
              child: ListView.builder(
                itemCount: wishListCtrl.offerList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.32,
                      motion: ScrollMotion(),
                      children: [
                        MyCartStyle().deleteLayout(primaryColor: wishListCtrl
                            .appCtrl.appTheme.primary,onTap: ()=>{})
                      ],
                    ),

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: MyCartCard(
                      onTap: () =>
                          Get.toNamed(routeName.productDetail),
                      data: wishListCtrl.offerList[index],
                      containerBoxColor: wishListCtrl
                          .appCtrl.appTheme.wishtListBoxColor,
                      descriptionColor: wishListCtrl
                          .appCtrl.appTheme.darkContentColor,
                      discountBoxColor:
                      wishListCtrl.appCtrl.appTheme.primary,
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
            );
          }
        );
      }
    );
  }
}
