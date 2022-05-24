import 'package:fastkart/config.dart';

class OrderSuccessStyle{

  //thankyou text layout
  Widget thankYouText(titleColor){
    return  OrderSuccessFontStyle().quicksandtextLayout(
        text: OrderSuccessFont().thankYou,
        fontWeight: FontWeight.bold,
        fontSize:
        OrderSuccessFontSize.textSizeLargeMedium,
        color: titleColor);
  }

  //description  text layout
  Widget descriptionText(darkContentColor){
    return  OrderSuccessFontStyle().mulishtextLayout(
        text: OrderSuccessFont().des,
        height: 1.5,
        fontWeight: FontWeight.normal,
        fontSize: OrderSuccessFontSize.textSizeSmall,
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        color: darkContentColor);
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }
}