import 'package:fastkart/config.dart';


//Widget Layout
class OrderHistoryWidget {

  //app bar
  PreferredSizeWidget appbarLayout(
      {var backgroundColor,
      var titleColor,
      String? image,
      GestureTapCallback? onTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: CommonAppBarLeading(
        onTap: () => Get.back(),
        isImage: false,
      ),
      title: OrderHistoryStyle().appBarTitleLayout(
          text: OrderHistoryFont().orderHistory, textColor: titleColor),
      actions: [
        AppBarHomeIconLayout(onTap: onTap,icon: iconAssets.drawerHome,),
      ],
    );
  }

  //map image
  Widget mapImage(){
    return Image.asset(
      iconAssets.map1,
      height: AppScreenUtil().screenHeight(70),
    );
  }
}
