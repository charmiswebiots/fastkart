import 'package:fastkart/views/pages/search/search_layout/search_recent_card_layout.dart';

import '../../../../config.dart';

class RecentSearchLayout extends StatelessWidget {
  const RecentSearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (searchCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenHeight(15),
            top: AppScreenUtil().screenHeight(15),
            right: AppScreenUtil().screenHeight(15)),
        height: AppScreenUtil().screenHeight(30),
        child: ListView.builder(
          itemCount: searchCtrl.recentSearch.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SearchRecentCard(
              data: searchCtrl.recentSearch[index],
              color: searchCtrl.appCtrl.appTheme.arrowSelectColor,
            );
          },
        ),
      );
    });
  }
}
