import 'package:fastkart/config.dart';

//Widget Layout
class OrderDetailWidget {
  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: OrderDetailFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //common price detail layout
  Widget commonPriceDetail(
      {String? title,
      String? val,
      var titleColor,
      var valColor,
      var fontWeight}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      OrderDetailWidget().commonTextLayout(
          text: title, color: titleColor, fontWeight: fontWeight),
      OrderDetailWidget()
          .commonTextLayout(text: val, color: valColor, fontWeight: fontWeight)
    ]);
  }

  //common title text layout
  Widget commonTitleText({String? title, var color}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: OrderDetailFontStyle().mulishtextLayout(
          text: title,
          fontSize: OrderDetailFontSize.textSizeSMedium,
          fontWeight: FontWeight.w700,
          color: color),
    );
  }

  //appbar layout
  PreferredSizeWidget appBarLayout(
      {var backgroundColor,
      var titleColor,
      String? image,
      GestureTapCallback? onTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: CommonAppBarLeading(onTap: () => Get.back(), isImage: false),
      title: OrderDetailStyle().appBarTitleLayout(
          text: OrderDetailFont().orderSummary, textColor: titleColor),
      actions: [AppBarHomeIconLayout(onTap: onTap,icon: iconAssets.drawerHome,)],
    );
  }
}
