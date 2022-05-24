import 'package:fastkart/config.dart';

//Widget Layout
class SearchWidget {
  //recent search text
  Widget recentSearchText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //Trending category text
  Widget trendingCategoryText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //Trending Product text
  Widget trendingProductText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //trending product list card
  Widget trendingProductCard({data, GestureTapCallback? onTap}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: AppScreenUtil().screenHeight(50),
            width: AppScreenUtil().screenWidth(90),
            margin: EdgeInsets.only(right: AppScreenUtil().screenWidth(20)),
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(12),
                vertical: AppScreenUtil().screenHeight(10)),
            decoration: BoxDecoration(
                border: Border.all(color: data.color, width: 2),
                color: data.containercolor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(10))),
            child: Image.asset(data.image, fit: BoxFit.contain)));
  }
}
