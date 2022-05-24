import '../../../../config.dart';

class HomeDataLayout extends StatelessWidget {
  const HomeDataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Column(
          children: [
            //search textformfield layout
            CommonSearchTextForm(
              text: HomeFont().searchProduct,
              borderColor: homeCtrl.appCtrl.appTheme.primary
                  .withOpacity(.3),
              hintColor: homeCtrl.appCtrl.appTheme.contentColor,
              fillcolor: homeCtrl.appCtrl.appTheme.textBoxColor,
              titleColor: homeCtrl.appCtrl.appTheme.titleColor,
            ),
            const Space(0, 20),
            //Banner
            BannerList(),
            const Space(0, 20),
            //recent bought widget
            RecentBoughtList(
              list: homeCtrl.recentBoughtList,
            ),
            const Space(0, 10),
            //recent bought widget
            const ShopByCategoryText(),
            const Space(0, 10),
            //shop by category list
            const ShopByCategory(),
            const Space(0, 20),
            //offer list widget
            const OfferListAndContent(),
            const Space(0, 20),
            //lowest price and everyday essential layout
            const BgLayout(),
            //coupons layout
            const CouponLayout(),
            const Space(0, 20),
            //lowest price and browse category layout
            const LowestPriceAndButton(),
          ],
        );
      }
    );
  }
}
