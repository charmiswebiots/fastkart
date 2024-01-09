import '../../../../config.dart';

class TrendingCategoryLayout extends StatelessWidget {
  const TrendingCategoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      builder: (searchCtrl) {
        return Container(
          padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(2)),
          margin: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(15),
              top: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          height: AppScreenUtil().screenHeight(55),
          child: ListView.builder(
            itemCount: searchCtrl.categoryData.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SearchWidget().trendingProductCard(
                  onTap: () =>
                      Get.toNamed(routeName.shopScreen),
                  data: searchCtrl.categoryData[index]);
            },
          ),
        );
      }
    );
  }
}
