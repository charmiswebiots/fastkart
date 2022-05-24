import 'package:fastkart/config.dart';

class OfferStyle{

  //terms and conditiontext
  Widget termsAndCondition(color){
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      child: OfferFontStyle().mulishtextLayout(
          text: OfferFont().termsConditions,
          color: color,
          fontSize: OfferFontSize.textSizeSMedium,
          fontWeight: FontWeight.w600),
    );
  }

  //common description text
  Widget commonDescriptionText({var color,String? text}){
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      child: OfferFontStyle().mulishtextLayout(
          text:
         text,
          color: color,
          fontSize: OfferFontSize.textSizeSmall,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.normal),
    );
  }

  //card bg layout
  Widget cardBGLayout({Widget? child,context,bool? isTheme}){
    return Container(
      height: AppScreenUtil().screenHeight(100),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          bottom: AppScreenUtil().screenHeight(15)),
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(18)),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isTheme! ? imageAssets.themeOfferBG:  imageAssets.offerBG,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  //use code text
  Widget useCodeText({String? text,var titleColor}){
    return  OfferFontStyle().quicksandtextLayout(
        text: text,
        color: titleColor,
        textAlign: TextAlign.start,
        fontSize: OfferFontSize.textSizeSmall,
        fontWeight: FontWeight.normal);
  }

  //code value layout
  Widget codeValueLayout({String? text, var primaryColor,var whiteColor}){
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(5)),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(40))),
      child: OfferFontStyle().quicksandtextLayout(
          text:text,
          color: whiteColor,
          fontSize: OfferFontSize.textSizeSmall,
          fontWeight: FontWeight.normal),
    );
  }

}