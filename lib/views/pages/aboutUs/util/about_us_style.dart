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
}