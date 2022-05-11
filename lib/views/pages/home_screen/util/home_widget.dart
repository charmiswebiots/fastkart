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
}
