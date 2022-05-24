import '../../../../config.dart';

class NotificationStyle {
  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return NotificationFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //icon layout
  Widget iconLayout({var color, String? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(18),
          vertical: AppScreenUtil().screenHeight(14)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        icon!,
        height: AppScreenUtil().screenHeight(20),
      ),
    );
  }

  //title layout
  Widget titleLayout({String? text, var color}) {
    return NotificationFontStyle().mulishtextLayout(
        text: text,
        fontSize: NotificationFontSize.textSizeSMedium,
        color: color);
  }
}
