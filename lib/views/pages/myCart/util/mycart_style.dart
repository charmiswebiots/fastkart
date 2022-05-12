import 'package:fastkart/config.dart';

class MyCartStyle {
  //preferred widget app bar
  PreferredSizeWidget appBarPreferred({context, Widget? child}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 65 : 70)),
      child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height /
                AppScreenUtil().screenHeight(18),
          ),
          child: child),
    );
  }

  //body layout
  Widget bodyComponentLayout({Widget? child, Widget? proceesToCheckout}) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          child!,

          // process to Checkout button
          proceesToCheckout!
        ],
      ),
    );
  }

  //delete layout
  Widget deleteLayout({GestureTapCallback? onTap, var primaryColor}) {
    return Container(
      width: AppScreenUtil().screenWidth(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(10)),
            bottomRight: Radius.circular(AppScreenUtil().borderRadius(10))),
      ),
      margin: EdgeInsets.symmetric(
        vertical: AppScreenUtil().screenHeight(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          iconAssets.delete,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return MyCartFontStyle().mulishtextLayout(
      text: text,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: textColor,
    );
  }

  //vertical divider
  Widget verticalDivider(dividerColor) {
    return VerticalDivider(
        color: dividerColor,
        width: 5,
        indent: 10,
        endIndent: 10,
        thickness: .5);
  }

  //image layout
  Widget imageLayout({String? image, GestureTapCallback? onTap}) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(image!,
            fit: BoxFit.fill,
            height: AppScreenUtil().screenHeight(45),
            width: AppScreenUtil().screenWidth(50)));
  }
}
