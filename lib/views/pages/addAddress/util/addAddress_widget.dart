import 'package:fastkart/config.dart';

//Widget Layout
class AddAddressWidget {

  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: AddAddressStyle().backIconStyle(child: Icon(
            Icons.arrow_back_sharp,
            size: AppScreenUtil().size(14),
            color: iconColor,
          ),borderColor: borderColor),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AddAddressFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.blacktextboxSearchIcon,
          color: iconColor,
          height: AppScreenUtil().screenHeight(18),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //send location layout
  Widget sendLocationLayout({var boxColor, String? icon}) {
    return Container(
      margin: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        icon!,
        height: AppScreenUtil().screenHeight(18),
      ),
    );
  }

  //appbar layout
  PreferredSizeWidget appBarLayout({GestureTapCallback? onTap,var bgColor,var titleColor,String? image}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: AddAddressWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: AddAddressWidget().appBarTitleLayout(
          text: AddAddressFont().addAddress,
          textColor: titleColor),
      actions: [
        AddAddressWidget().appBarActionLayout(
            iconColor: titleColor,onTap: onTap),
      ],
    );
  }


}
