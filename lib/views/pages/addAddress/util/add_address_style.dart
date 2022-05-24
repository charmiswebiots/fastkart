import '../../../../config.dart';

class AddAddressStyle{

  //prefix icon
  Widget prefixIcon(titleColor){
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil()
              .screenHeight(AppScreenUtil()
              .screenActualWidth() >
              370
              ? 10
              : 15)),
      child: Image.asset(
        iconAssets.voice,
        fit: BoxFit.contain,
        color: titleColor,
        height: AppScreenUtil()
            .screenHeight(10),
        width:
        AppScreenUtil().screenWidth(10),
      ),
    );
  }

  //use current location
  Widget useCurrentLocation(titleColor){
    return  AddAddressFontStyle().mulishtextLayout(
        text: AddAddressFont()
            .useCurrentLocation,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontSize: AddAddressFontSize
            .textSizeMedium);
  }

  //back icon style
  Widget backIconStyle({Widget? child,var borderColor,isRTL}){
    return  Container(
      height: AppScreenUtil().screenHeight(
          AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
      width: AppScreenUtil().screenHeight(
          AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
      margin: EdgeInsets.only(
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(isRTL ? 10 :0),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}