import '../../../../config.dart';

class Error404Widget {
  //appbar leading layout
  Widget appBarLeadingLayout(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
        isRTL,
      String? image,String? language}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(language == "ar" || isRTL ? 15 :0),
                bottom: AppScreenUtil().screenHeight(4)),
            child: Image.asset(
              iconAssets.category,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }

  //common icon image layout
  Widget commonIconImage({String? image, double? height, var color}) {
    return Image.asset(
      image!,
      height: AppScreenUtil().screenHeight(height!),
      color: color,
    );
  }

  //back to home widget
  Widget backToHomeWidget(
      {String? text,
      color,
      GestureTapCallback? onTap,
      fontColor,
      BuildContext? context}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context!).size.width /
            AppScreenUtil().screenWidth(2.5),
        alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(12)),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: Error404FontStyle().mulishtextLayout(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }
}
