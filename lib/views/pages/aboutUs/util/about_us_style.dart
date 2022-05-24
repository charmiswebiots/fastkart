import '../../../../config.dart';

class AboutUsStyle{

  //common title
  Widget commonTitle({String? text, var color}){
    return //who we are text layout
      AboutUsFontStyle().mulishtextLayout(text: text,color: color,fontWeight: FontWeight.w700,fontSize: AboutUsFontSize.textSizeSMedium);
  }

  //common image layout
  Widget commonImage({String? image}){
    return Image.asset(
      image!,
      height:
      AppScreenUtil().screenHeight(20),
    );
  }

  //who we are value layout
  Widget whoWeAreText(color){
    return  AboutUsFontStyle().mulishtextLayout(
        text: AboutUsFont().desc,
        height: 1.5,
        color:
        color,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.clip,
        fontSize: AboutUsFontSize.textSizeSmall);
  }

  //id layout
  Widget idLayout({var primaryColor,String? text,var whiteColor }){
    return    Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(11),
          vertical: AppScreenUtil().screenHeight(7)),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius:
          BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: AboutUsStyle()
          .commonTitle(text: text, color: whiteColor),
    );
  }

  //text layout
  Widget textLayout({Widget? child,String? languageVal,isRTL,var containerColor}){
    return Container(
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(15),
            right: AppScreenUtil().screenWidth(
                languageVal == "ar" || isRTL ? 15 : 0)),
        padding: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(
                languageVal == "ar" || isRTL ? 10 : 30),
            right: AppScreenUtil().screenWidth(
                languageVal == "ar" || isRTL ? 30 : 10),
            top: AppScreenUtil().screenHeight(18),
            bottom: AppScreenUtil().screenHeight(18)),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius:
            BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: child);
  }
}