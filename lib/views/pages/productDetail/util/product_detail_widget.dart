import 'package:fastkart/config.dart';

//Widget Layout
class ProductDetailWidget {
  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 10 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.share,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
        color: iconColor,
      ),
    );
  }

  //lowest price
  Widget lowestPrice(
      {Widget? child,
      var containerColor,
      BuildContext? context,
      bool? isBigScreen}) {
    return Container(
      color: containerColor,
      width: MediaQuery.of(context!).size.width,
      height: MediaQuery.of(context).size.height *
          (AppScreenUtil().screenActualWidth() > 377 ? 35 : 42) /
          100,
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      child: child,
    );
  }

  //Common Horizontal list layout
  Widget commonHorizontalListLayout(
      {BuildContext? context,
      String? title,
      String? seeAllText,
      var data,
      var lowestPriceColor,
      var payLessColor,
      bool? isBigScreen}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //everyday essential and see all  widget
        ProductDetailStyle().commonTitleAndSeeAllWidget(
            title: title,
            seeAllText: seeAllText,
            seeAllColor: lowestPriceColor),
        const Space(0, 5),
        //popular offers of the day text widget
        ProductDetailStyle().commonDescriptionTextWidget(
            text: ProductDetailFont().payLessGetMore, color: payLessColor),
        //lowest price list
        SizedBox(
          height: MediaQuery.of(context!).size.height *
              (AppScreenUtil().screenActualWidth() > 377 ? 27 : 30) /
              100,
          child: ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EveryDayEssentialCard(
                index: index,
                data: data[index],
              );
            },
          ),
        )
      ],
    );
  }
}
