import 'package:fastkart/config.dart';

//Widget Layout
class SettingWidget {
  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return SettingFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
      title:
          SettingWidget().appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        AppBarHomeIconLayout(icon: iconAssets.drawerHome, onTap: onTap)
      ],
    );
  }

  //edit icon layout
  Widget editIcon({context, var primaryColor}) {
    return Positioned(
        top: MediaQuery.of(context).size.height * .8 / 10,
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(6),
                vertical: AppScreenUtil().screenHeight(5)),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(60))),
            child: Image.asset(iconAssets.edit,
                height: AppScreenUtil().screenHeight(18))));
  }

  //user name text layout
  Widget userNameLayout(color) {
    return SettingFontStyle().mulishtextLayout(
        text: 'Andrea Joanne',
        fontSize: SettingFontSize.textSizeMedium,
        fontWeight: FontWeight.w700,
        color: color);
  }


}
