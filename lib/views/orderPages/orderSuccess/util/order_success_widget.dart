import 'package:fastkart/config.dart';

//Widget Layout
class OrderSuccesWidget {

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
           
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
              bottom: AppScreenUtil().screenHeight(4)
            ),

            child: Image.asset(iconAssets.category,color: iconColor,),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor,bool? isTheme}) {
    return Image.asset(image!,width: AppScreenUtil().screenWidth(100),);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor,GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370?  13 : 20),
          top: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370?  13 : 20),
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

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return OrderSuccessFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: OrderSuccessFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //app bar layout
  PreferredSizeWidget appBarLayout({GestureTapCallback? onTap,var bgColor,var titleColor,String? image,GestureTapCallback? actionTap}){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderSuccesWidget().appBarLeadingLayput(
          onTap:onTap,
          borderColor: titleColor,
          iconColor: titleColor,),
      title: OrderSuccesWidget().appBarTitleLayout(
          image: image,
          textColor: titleColor),
      actions: [
        OrderSuccesWidget().appBarActionLayout(
            iconColor: titleColor,onTap: actionTap),
      ],
    );
  }
}
