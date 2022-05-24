import 'package:fastkart/config.dart';

//Widget Layout
class OfferWidget {
  //filter text
  Widget filterText({var color, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: OfferFontStyle().mulishtextLayout(
          text: OfferFont().filter,
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w600),
    );
  }

  //pop layout
  Widget popLayout({Widget? child, var categoryTextColor, context}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height / 2.3,
        child: child);
  }

  //code display layout
  Widget codeLayout({Widget? child, var lightPrimary}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: lightPrimary,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }

  //copy Code style
  Widget copyCodeButton({text, var whiteColor, var primaryColor}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(12),
            vertical: AppScreenUtil().screenHeight(6)),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(50))),
        child: OfferFontStyle().mulishtextLayout(
            text: text,
            color: primaryColor,
            fontSize: OfferFontSize.textSizeSMedium,
            fontWeight: FontWeight.bold));
  }
}
