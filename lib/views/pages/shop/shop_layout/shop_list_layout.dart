import '../../../../config.dart';

class ShopListLayout extends StatelessWidget {
  const ShopListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return ShopWidget().shopLayout(
            context: context,
            child: ListView.builder(
              itemCount: shopCtrl.offerList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ShopListCard(
                  onTap: () => Get.toNamed(routeName.productDetail),
                  index: index,
                  data: shopCtrl.offerList[index],
                  discountTextColor: shopCtrl.appCtrl.appTheme.whiteColor,
                  dividerColor: shopCtrl.appCtrl.appTheme.contentColor
                      .withOpacity(.5),
                  quantityBorderColor:
                  shopCtrl.appCtrl.appTheme.lightPrimary,
                  titleColor: shopCtrl.appCtrl.appTheme.titleColor,
                  plusTap: () => shopCtrl.plusTap(index),
                  minusTap: () => shopCtrl.minusTap(index),
                );
              },
            ));
      }
    );
  }
}
