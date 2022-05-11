import '../../../../config.dart';

class OrderTrackStyle{
  //background layout
  Widget backgroundLayout({context}) {
    return Image.asset(
      imageAssets.mapSection,
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height /1.7,
      fit: BoxFit.fill,
    );
  }

  //estimated delivery text value layout
  Widget estimatedDelivery(primary){
    return OrderTrackFontStyle().mulishtextLayout(
        text: "9.00am - 12.00pm",
        fontWeight: FontWeight.bold,
        fontSize: OrderTrackFontSize
            .textSizeMedium,
        color: primary);
  }

  //estimated delivery text layout
  Widget estimatedDeliveryText(darkContentColor){
    return   //estimated delivery text layout
      OrderTrackFontStyle().mulishtextLayout(
          text: OrderTrackFont().estimateTime,
          color: darkContentColor);
  }

  //divider layout
  Widget dividerLayout(contentColor){
    return //line divider layout
      Divider(
        color:contentColor,
        indent: 15,
        endIndent: 15,
      );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }


  // vertical line divider layout
  Widget verticalLineDivider(){
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil()
              .screenWidth(20)),
      child: Image.asset(
        iconAssets.line,
        height: AppScreenUtil()
            .screenHeight(30),
      ),
    );
  }


  //common layout for call and chat
  Widget commonLayoutForIcon({String? image, var boxColor, var borderColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        image!,
        height: AppScreenUtil().screenHeight(16),
      ),
    );
  }

  //content background layout
  Widget contentBGLayout({var color, Widget? child, context}) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height /2.2),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
      child: child,
    );
  }

}