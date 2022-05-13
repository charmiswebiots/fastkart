

import '../../../../config.dart';

class ProductReviewAndSeeAll extends StatelessWidget {
  final String? text;
  final String? seeAll;
  final GestureTapCallback? onTap;
  const ProductReviewAndSeeAll({Key? key,this.text,this.seeAll,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailFontStyle().mulishtextLayout(
                  text: text,
                  fontSize: 14,
                  color: appCtrl.appTheme.titleColor,
                  fontWeight: FontWeight.w600),
              InkWell(
                  onTap: onTap,
                  child: ProductDetailFontStyle().mulishtextLayout(
                      text: seeAll,
                      fontSize: 12,
                      color: appCtrl.appTheme.primary,
                      fontWeight: FontWeight.w700))
            ],
          ),
        );
      }
    );
  }
}
