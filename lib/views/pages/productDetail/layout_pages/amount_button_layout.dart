import 'package:fastkart/views/pages/productDetail/layout_pages/price_quantity_button.dart';
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
            const PriceQuantityButton(),
            InkWell(
              onTap: () => Get.toNamed(routeName.myCart, arguments: true),
              child: Row(
                children: [
                  ProductDetailFontStyle().mulishtextLayout(
                      text: ProductDetailFont().addToCart,
                      color: productDetailCtrl.appCtrl.appTheme.white,
                      fontSize: ProductDetailFontSize.textSizeSMedium),
                  const Space(5, 0),
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
