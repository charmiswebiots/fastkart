import 'package:fastkart/views/pages/category/util/recentSearchLayout.dart';
import 'package:fastkart/views/pages/category/util/trendingCategoryLayout.dart';
import 'package:fastkart/views/pages/category/util/trendingProductLayout.dart';

import '../../../config.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchCtrl = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_) {
      return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
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
                          text: CategoryFont().searchProduct,
                          borderColor: searchCtrl.appCtrl.appTheme.primary
                              .withOpacity(.3),
                          hintColor: searchCtrl.appCtrl.appTheme.contentColor,
                          fillcolor: searchCtrl.appCtrl.appTheme.textBoxColor,
                          titleColor: searchCtrl.appCtrl.appTheme.titleColor,
                        ),
                        Space(0, 20),
                        //recent search text layout
                        SearchWidget().recentSearchText(
                            text: SearchFont().recentlySearch,
                            color: searchCtrl.appCtrl.appTheme.titleColor),

                        //recent search list layout
                        const RecentSearchLayout(),
                        Space(0, 20),

                        //trending category text layout
                        SearchWidget().trendingCategoryText(
                            text: SearchFont().trendingCategory,
                            color: searchCtrl.appCtrl.appTheme.titleColor),

                        //recent search list layout
                        const TrendingCategoryLayout(),
                        Space(0, 20),

                        //trending product text layout
                        SearchWidget().trendingProductText(
                            text: SearchFont().trendingProducts,
                            color: searchCtrl.appCtrl.appTheme.titleColor),
                        Space(0, 15),

                        //trending product list
                      const  TrendingProductLayout()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
