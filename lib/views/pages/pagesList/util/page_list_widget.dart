import 'package:fastkart/config.dart';

//Widget Layout
class PageListWidget {

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return PageListFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //description layout
  Widget descriptionLayout({context,var boxColor,var titleColor}){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10),horizontal: AppScreenUtil().screenWidth(15)),
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
          color:boxColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(6))
      ),
      child: PageListFontStyle().mulishtextLayout(
          height: 1.5,
          text: "detail3".tr,
          overflow: TextOverflow.clip,
          color: titleColor,
          fontWeight: FontWeight.w600,
          fontSize: PageListFontSize.textSizeSmall),
    );
  }
}
