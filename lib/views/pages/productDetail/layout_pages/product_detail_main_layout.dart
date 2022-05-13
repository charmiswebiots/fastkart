import '../../../../config.dart';

class ProductDetailMainLayout extends StatelessWidget {
  const ProductDetailMainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
      return SingleChildScrollView(
        child: Column(
          children: [
            //banner layout
            const BannerLayout(),
            ProductDetailStyle().detailLayout(
                whiteColor: productDetailCtrl.appCtrl.appTheme.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //product name layout
                    ProductDetailStyle().productNameTextLayout(),

                    //rating layout
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: Row(
                        children: [
                          CommonRatingLayout(
                              value: productDetailCtrl.rating,
                              onRatingUpdate: (rating) {}),
                          Space(5, 0),
                          ProductDetailStyle().ratingValueLayout(
                              productDetailCtrl
                                  .appCtrl.appTheme.darkContentColor),
                        ],
                      ),
                    ),
                    //price layout
                    const ProductPriceLayout(
                      discountPrice: '25.00',
                      totalPrice: '45.00',
                      discountText: '25% off',
                    ),

                    Space(0, 15),
                    // select quantity and delivery time
                    const QuantityDeliverTimeLayout(),
                    Space(0, 15),

                    //detail layout
                    const CommonProductDetailLayout(),

                    Space(0, 15),
                    //product review count and see All text
                    ProductReviewAndSeeAll(
                        text: 'Product Review(15)',
                        onTap: () => productDetailCtrl.commonBottomSheet(
                            context: context,index: 2),
                        seeAll: ProductDetailFont().seeAll),

                    Space(0, 20),
                    //reviewList layout
                    const ProductReview(),
                    Space(0, 20),

                    //lowest price
                    ProductDetailWidget().lowestPrice(
                      isBigScreen: true,
                      containerColor:
                          productDetailCtrl.appCtrl.appTheme.lowestBgColor,
                      context: context,
                      child: CommonHorizontalList(
                        text: ProductDetailFont().lowestPrice,
                        title: ProductDetailFont().payLessGetMore,
                        data: AppArray().lowerPriceList,
                      ),
                    ),
                    Space(0, 50),
                  ],
                ))
          ],
        ),
      );
    });
  }
}
