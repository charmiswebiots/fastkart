

import '../../../../config.dart';

class ProductPriceLayout extends StatelessWidget {
  final String? discountPrice;
  final String? totalPrice;
  final String? discountText;
  const ProductPriceLayout({Key? key,this.discountPrice,this.totalPrice,this.discountText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Row(
            children: [
              ProductDetailFontStyle().mulishtextLayout(
                  text: ProductDetailFont().dollar + discountPrice!,
                  fontSize: ProductDetailFontSize.textSizeMedium,
                  color: appCtrl.appTheme.titleColor,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip),
              const Space(10, 0),
              ProductDetailFontStyle().mulishtextLayout(
                  text: ProductDetailFont().dollar + totalPrice!,
                  fontSize: ProductDetailFontSize.textSizeSMedium,
                  textDecoration: TextDecoration.lineThrough,
                  color: appCtrl.appTheme.darkContentColor,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.clip),
              const  Space(10, 0),
              ProductDetailFontStyle().mulishtextLayout(
                  text: discountText,
                  fontSize: ProductDetailFontSize.textSizeSMedium,
                  color: appCtrl.appTheme.primary,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.clip),
            ],
          ),
        );
      }
    );
  }
}
