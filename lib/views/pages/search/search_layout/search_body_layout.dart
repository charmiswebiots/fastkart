import '../../../../config.dart';

class SearchBodyLayout extends StatelessWidget {
  const SearchBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      builder: (searchCtrl) {
        return SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //search product textformfield layout
                    CommonSearchTextForm(
                      text: SearchFont().searchProduct,
                      borderColor: searchCtrl.appCtrl.appTheme.primary
                          .withOpacity(.3),
                      hintColor:
                      searchCtrl.appCtrl.appTheme.contentColor,
                      fillcolor:
                      searchCtrl.appCtrl.appTheme.textBoxColor,
                      titleColor:
                      searchCtrl.appCtrl.appTheme.titleColor,
                    ),
                    const Space(0, 20),
                    //recent search text layout
                    SearchWidget().recentSearchText(
                        text: SearchFont().recentlySearch,
                        color: searchCtrl.appCtrl.appTheme.titleColor),

                    //recent search list layout
                    const RecentSearchLayout(),
                    const Space(0, 20),

                    //trending category text layout
                    SearchWidget().trendingCategoryText(
                        text: SearchFont().trendingCategory,
                        color: searchCtrl.appCtrl.appTheme.titleColor),

                    //recent search list layout
                    const TrendingCategoryLayout(),
                    const Space(0, 20),

                    //trending product text layout
                    SearchWidget().trendingProductText(
                        text: SearchFont().trendingProducts,
                        color: searchCtrl.appCtrl.appTheme.titleColor),
                    const Space(0, 15),

                    //trending product list
                    const TrendingProductLayout()
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
