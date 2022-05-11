import '../../../../config.dart';

class RecentSearchLayout extends StatelessWidget {
  const RecentSearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(15),
              top: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          height: AppScreenUtil().screenHeight(30),
          child: ListView.builder(
            itemCount: AppArray().recentSearch.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SearchWidget().recentListCard(
                data: AppArray().recentSearch[index],
                color: appCtrl.appTheme.arrowSelectColor,
              );
            },
          ),
        );
      }
    );
  }
}
