import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/responsive_layout.dart';

//Widget Layout
class AboutUsWidget {
  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      children: [
        CommonAppBarLeading(
          onTap: onTap,
          isImage: false,
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AboutUsFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap,context}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              ResponsiveWidget.isSmallScreen(context) ? 18: 15),
          top: AppScreenUtil().screenHeight(
              ResponsiveWidget.isSmallScreen(context) ? 18 : 15),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.drawerHome,
          color: iconColor,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //app bar layout
  PreferredSizeWidget appBarLayout(
      {var bgColor, var titleColor, String? image, GestureTapCallback? onTap,context}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: AboutUsWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: AboutUsWidget().appBarTitleLayout(
          text: AboutUsFont().aboutUs, textColor: titleColor),
      actions: [
        AboutUsWidget().appBarActionLayout(iconColor: titleColor, onTap: onTap,context: context),
      ],
    );
  }
}
