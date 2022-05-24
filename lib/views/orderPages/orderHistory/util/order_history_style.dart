import 'package:fastkart/config.dart';

class OrderHistoryStyle {
  //filter text
  Widget filterText(titleColor) {
    return OrderHistoryFontStyle().mulishtextLayout(
        text: OrderHistoryFont().filter,
        fontSize: OrderHistoryFontSize.textSizeMedium,
        color: titleColor);
  }

  //time filter text
  Widget timeFilterText(titleColor) {
    return OrderHistoryFontStyle().mulishtextLayout(
        text: OrderHistoryFont().timefilter,
        fontSize: OrderHistoryFontSize.textSizeMedium,
        color: titleColor);
  }

  //common text layout
  Widget commonTextLayout(
      {String? text, var color, var fontWeight = FontWeight.w700}) {
    return OrderHistoryFontStyle().mulishtextLayout(
        text: text,
        fontWeight: fontWeight,
        fontSize: OrderHistoryFontSize.textXSizeSmall,
        color: color);
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return OrderHistoryFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //days list card
  Widget daysListCard(
      {var data,
      int? index,
      GestureTapCallback? onTap,
      int? selectIndex,
      color}) {
    return Padding(
      padding: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(12),
          left: AppScreenUtil().screenWidth(index == 0 ? 15 : 0)),
      child: InkWell(
          onTap: onTap,
          child: OrderHistoryFontStyle().mulishtextLayout(
              text: data['title'].toString(),
              fontSize: OrderHistoryFontSize.textSizeSMedium,
              fontWeight: FontWeight.normal,
              color: color)),
    );
  }
}
