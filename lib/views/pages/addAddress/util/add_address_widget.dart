import 'package:fastkart/config.dart';

//Widget Layout
class AddAddressWidget {
  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AddAddressFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //send location layout
  Widget sendLocationLayout({var boxColor, String? icon,isRTL}) {
    return Container(
      margin: EdgeInsets.only(left: AppScreenUtil().screenWidth(20),right: AppScreenUtil().screenHeight(isRTL ? 20 :0)),
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
  PreferredSizeWidget appBarLayout({GestureTapCallback? onTap,var bgColor,var titleColor,String? image,isRTL}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: CommonAppBarLeading(
          onTap: () => Get.back(),isImage: false,),
      title: AddAddressWidget().appBarTitleLayout(
          text: AddAddressFont().addAddress,
          textColor: titleColor),
      actions: [
        Padding(
          padding:EdgeInsets.only(right: AppScreenUtil().screenWidth(isRTL ? 15 :0)),
          child: AppBarHomeIconLayout(
              icon: iconAssets.blacktextboxSearchIcon,onTap: onTap),
        ),
      ],
    );
  }


}
