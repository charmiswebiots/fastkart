import 'package:fastkart/config.dart';

//Widget Layout
class MyWishListWidget {

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
      leading: CommonAppBarLeading(
          onTap: () => Get.back(),
        isImage: false,
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
