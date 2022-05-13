

import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class AmountButtonLayout extends StatelessWidget {
  const AmountButtonLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
      return Container(
        height: AppScreenUtil().screenHeight(55),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(20),
            vertical: AppScreenUtil().screenHeight(5)),
        decoration: BoxDecoration(
            color: productDetailCtrl.appCtrl.appTheme.primary,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(5),
                  vertical: AppScreenUtil().screenHeight(10)),
              decoration: BoxDecoration(
                  color: productDetailCtrl.appCtrl.appTheme.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(10))),
              child: GetBuilder<ProductDetailController>(builder: (ctrl) {
                return Row(
                  children: [
                    InkWell(
                        onTap: () => productDetailCtrl.decreaseQuantity(),
                        child: Icon(CupertinoIcons.minus,
                            color:
                                productDetailCtrl.appCtrl.appTheme.titleColor)),
                    Space(15, 0),
                    ProductDetailFontStyle().mulishtextLayout(
                        text: productDetailCtrl.quantity.toString(),
                        fontWeight: FontWeight.normal,
                        fontSize: ProductDetailFontSize.textSizeSMedium,
                        color: productDetailCtrl.appCtrl.appTheme.primary),
                    Space(15, 0),
                    InkWell(
                        onTap: () => productDetailCtrl.increaseQuantity(),
                        child: Icon(Icons.add,
                            color:
                                productDetailCtrl.appCtrl.appTheme.titleColor))
                  ],
                );
              }),
            ),
            InkWell(
              onTap: () => Get.toNamed(routeName.myCart, arguments: true),
              child: Row(
                children: [
                  ProductDetailFontStyle().mulishtextLayout(
                      text: ProductDetailFont().addToCart,
                      color: productDetailCtrl.appCtrl.appTheme.white,
                      fontSize: ProductDetailFontSize.textSizeSMedium),
                  Space(5, 0),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: productDetailCtrl.appCtrl.appTheme.white,
                    size: AppScreenUtil().size(18),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
