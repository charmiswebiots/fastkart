import 'package:fastkart/config.dart';

//Widget Layout
class HomeWidget {
  //shop by category widget
  Widget shopByCategory({String? text, color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text, color: color, fontSize: 14, fontWeight: FontWeight.w800);
  }

  //common description text Widget
  Widget commonDescriptionTextWidget({String? text, var color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.normal,
        fontSize: HomeFontSize.textSizeSmall,
        color: color);
  }

  //browse category button layout
  Widget browseCategoryButtonLayout(
      {var buttonColor, var textColor, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: AppScreenUtil().screenWidth(150),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: HomeFontStyle().mulishtextLayout(
            color: textColor,
            text: HomeFont().browseCategory,
            fontSize: 12,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  //discount layout
  Widget discountLayout({var color, String? text, var textColor}) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left: AppScreenUtil().screenHeight(5)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(3)),
      child: HomeFontStyle().mulishtextLayout(
        text: text,
        fontSize: 10,
        color: textColor,
      ),
    );
  }

  //quantity layout
  Widget quantityLayout({var color, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(8),
          horizontal: AppScreenUtil().screenWidth(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(color: color)),
      child: child,
    );
  }

  //common offer layout
  Widget commonOfferLayout(
      {Widget? child, GestureTapCallback? onTap, context, var color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(10),
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenHeight(10)),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: IntrinsicHeight(
          child: child,
        ),
      ),
    );
  }
}
