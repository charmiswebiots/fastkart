import '../../../../config.dart';

class ShopStyle{

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return ShopFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }


  //decorated box layout
  Widget decoratedBoxLayout(
      {var wishtListBoxColor, var borderColor, Widget? child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: wishtListBoxColor,
        //background color of dropdown button
        border: Border.all(color: borderColor, width: .5),
        //border of dropdown button
        borderRadius: BorderRadius.circular(
            AppScreenUtil().borderRadius(5)), //border raiuds of dropdown button
      ),
      child: child,
    );
  }
}