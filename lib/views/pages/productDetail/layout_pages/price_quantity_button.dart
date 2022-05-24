import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class PriceQuantityButton extends StatelessWidget {
  const PriceQuantityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (productDetailCtrl) {
        return Container(
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
                const Space(15, 0),
                ProductDetailFontStyle().mulishtextLayout(
                    text: productDetailCtrl.quantity.toString(),
                    fontWeight: FontWeight.normal,
                    fontSize: ProductDetailFontSize.textSizeSMedium,
                    color: productDetailCtrl.appCtrl.appTheme.primary),
                const Space(15, 0),
                InkWell(
                    onTap: () => productDetailCtrl.increaseQuantity(),
                    child: Icon(Icons.add,
                        color:
                        productDetailCtrl.appCtrl.appTheme.titleColor))
              ],
            );
          }),
        );
      }
    );
  }
}
