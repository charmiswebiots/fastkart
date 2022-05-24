import 'package:fastkart/config.dart';

//Widget Layout
class PaymentWidget {
  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: PaymentFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //common price detail layout
  Widget commonPriceDetail(
      {String? title,
      String? val,
      var titleColor,
      var valColor,
      var fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        PaymentWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image,isRTL}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
              right: AppScreenUtil().screenWidth(isRTL ?12 :0),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //app bar layout
  PreferredSizeWidget appBarLayout(
      {var paymentBgColor, var titleColor, bool? isTheme,isRTL}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: paymentBgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: PaymentWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          isRTL:isRTL,
          image: isTheme! ? imageAssets.themeFkLogo : imageAssets.fkLogo),
      title: PaymentStyle().appBarTitleLayout(
          text: PaymentFont().addPaymentMethod, textColor: titleColor),
    );
  }

  //add card text
  Widget addCardText(titleColor) {
    return PaymentFontStyle().mulishtextLayout(
        text: PaymentFont().addCard,
        fontWeight: FontWeight.w600,
        fontSize: ProductDetailFontSize.textSizeSMedium,
        color: titleColor);
  }
}
