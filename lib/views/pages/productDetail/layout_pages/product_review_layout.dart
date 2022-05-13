import 'package:fastkart/config.dart';


class ProductReview extends StatelessWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProductDetailController>(
      builder: (productDetailCtrl) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15)),
          height: AppScreenUtil().screenHeight(320),
          child: ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ReviewCard(
                data: productDetailCtrl.reviewList[index],
                glowColor:
                productDetailCtrl.appCtrl.appTheme.primary,
                unratedColor:
                productDetailCtrl.appCtrl.appTheme.contentColor,
                ratingColor:
                productDetailCtrl.appCtrl.appTheme.ratingColor,
                color: productDetailCtrl
                    .appCtrl.appTheme.wishtListBoxColor,
                descColor: productDetailCtrl
                    .appCtrl.appTheme.darkContentColor,
                nameColor:
                productDetailCtrl.appCtrl.appTheme.titleColor,
              );
            },
          ),
        );
      }
    );
  }
}
