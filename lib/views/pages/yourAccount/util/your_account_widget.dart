import 'package:fastkart/config.dart';

//Widget Layout
class YourAccountWidget {
  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return YourAccountFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //common appbar
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, var bgColor, var titleColor, var text}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: CommonAppBarLeading(
        onTap: () => Get.back(),
        isImage: false,
      ),
      title: YourAccountWidget()
          .appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        AppBarHomeIconLayout(icon: iconAssets.drawerHome, onTap: onTap),
      ],
    );
  }
}
