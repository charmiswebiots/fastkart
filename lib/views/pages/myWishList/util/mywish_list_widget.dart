import 'package:fastkart/config.dart';

//Widget Layout
class MyWishListWidget {

  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
        var borderColor,
        var iconColor,}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return MyWishListFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor,GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 15: 18),
          top: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 13: 18),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.bag,
          color: iconColor,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }


  //app bar layout
  PreferredSizeWidget appbarLayout({GestureTapCallback? onTap,var bgColor,var titleColor, var text}){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: MyWishListWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          ),
      title: MyWishListWidget().appBarTitleLayout(
          text: text,
          textColor: titleColor),
      actions: [
        MyWishListWidget().appBarActionLayout(
            iconColor: titleColor,onTap: onTap),
      ],
    );
  }

}
