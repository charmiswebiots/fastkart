import 'package:fastkart/config.dart';

class OrderDetailStyle {
  // items text layout
  Widget commonTextLayout(text, primaryColor) {
    return OrderDetailWidget()
        .commonTitleText(title: text, color: primaryColor);
  }

  //payment method layout
  Widget paymentMethodLayout(titleColor) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Row(
        children: [
          Image.asset(
            imageAssets.masterCard1,
            height: AppScreenUtil().screenHeight(30),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: OrderDetailFontStyle().mulishtextLayout(
                text: "**** **** **** 6502",
                fontSize: OrderDetailFontSize.textSizeSmall,
                fontWeight: FontWeight.normal,
                color: titleColor),
          ),
        ],
      ),
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //icon back layout
  Widget iconBack({var iconColor, var borderColor}) {
    return Container(
      height: AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
      width: AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
      margin: EdgeInsets.only(
        left: AppScreenUtil().screenWidth(15),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: Icon(
        Icons.arrow_back_sharp,
        size: AppScreenUtil().size(14),
        color: iconColor,
      ),
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(iconAssets.drawerHome,
            color: iconColor,
            height: AppScreenUtil().screenHeight(20),
            fit: BoxFit.contain),
      ),
    );
  }

  //quantity layout
  Widget quantityLayout({var quantityLayoutColor, Widget? child}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(7),
          vertical: AppScreenUtil().screenHeight(4)),
      decoration: BoxDecoration(
          color: quantityLayoutColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }
}
