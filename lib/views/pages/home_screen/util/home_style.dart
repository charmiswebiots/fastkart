import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/responsive_layout.dart';

class HomeStyle{

  //common title and see all widget
  Widget commonTitleAndSeeAllWidget(
      {String? title, String? seeAllText, var seeAllColor, var textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeFontStyle().mulishtextLayout(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: HomeFontSize.textSizeSMedium,
            color: textColor),
        HomeFontStyle().mulishtextLayout(
            text: seeAllText,
            fontSize: 12,
            color: seeAllColor,
            fontWeight: FontWeight.w700),
      ],
    );
  }

//line border widget
  Widget lineBorderWidget({BuildContext? context, var bordercolor}) {
    return Container(
      child: SizedBox(
        width:
        MediaQuery.of(context!).size.width / AppScreenUtil().screenWidth(4),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: bordercolor, width: 2),
        ),
      ),
    );
  }


  //say hello and see all  widget
  Widget sayHelloLayout(textColor,seeAllColor){
    return  Padding(
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(25),
      ),
      child: HomeStyle().commonTitleAndSeeAllWidget(
          title: HomeFont().sayHelloToOffer,
          seeAllText: HomeFont().seeAll,
          textColor: textColor,
          seeAllColor: seeAllColor),
    );
  }

  //recently bought widget
  Widget recentlyBought({String? text, color}) {
    return HomeFontStyle()
        .mulishtextLayout(text: text, color: color, fontSize: 14);
  }



  //lowest price and everyday essential container widget
  Widget lowestPriceAndEveryDayEssentialWidget(
      {Widget? child,
        var containerColor,
        BuildContext? context,
        }) {
    return Container(
      color: containerColor,
      width: MediaQuery.of(context!).size.width,
      height: MediaQuery.of(context).size.height *
          (ResponsiveWidget.isSmallScreen(context) ? 80 : 67) /
          100,
      padding:
      EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: child,
    );
  }


  //didn't find what you were looking for text
  Widget didntFindWhatLookingForLayout({var fontColor, String? text}) {
    return HomeFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w700,
        color: fontColor,
        fontSize: 22,
        overflow: TextOverflow.clip);
  }
}