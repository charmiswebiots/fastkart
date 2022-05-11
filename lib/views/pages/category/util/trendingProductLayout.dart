import '../../../../config.dart';

class TrendingProductLayout extends StatelessWidget {
  const TrendingProductLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<SearchController>(builder: (searchCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: appCtrl.appTheme.offerBoxColor,
          padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(10),
              left: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.toNamed(routeName.productDetail),
                child: CommonOfferListCard(
                  data: searchCtrl.offerList[index],

                  plusTap: () => searchCtrl.plusTap(index),
                  minusTap: () => searchCtrl.minusTap(index),
                ),
              );
            },
          ),
        );
      });
    });
  }
}
