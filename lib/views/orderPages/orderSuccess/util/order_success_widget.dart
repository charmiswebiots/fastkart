import 'package:fastkart/config.dart';

//Widget Layout
class OrderSuccesWidget {
  //appbar leading layout
  Widget appBarLeadingLayput({
    GestureTapCallback? onTap,
    var borderColor,
    var iconColor,
    isRTL
  }) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                bottom: AppScreenUtil().screenHeight(4),right: AppScreenUtil().screenWidth(isRTL ? 12 :0)),
            child: Image.asset(
              iconAssets.category,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }


  //app bar layout
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap,
      var bgColor,
      var titleColor,
      String? image,
        isRTL,
      GestureTapCallback? actionTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderSuccesWidget().appBarLeadingLayput(
        onTap: onTap,
        borderColor: titleColor,isRTL: isRTL,
        iconColor: titleColor,
      ),
      title: OrderSuccessStyle()
          .appBarTitleLayout(image: image, textColor: titleColor),
      actions: [
        AppBarHomeIconLayout(onTap: actionTap,icon: iconAssets.drawerHome,),
      ],
    );
  }
}
