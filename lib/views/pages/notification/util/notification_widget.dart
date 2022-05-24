import 'package:fastkart/config.dart';

//Widget Layout
class NotificationWidget {
  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
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

  //Tabar layout
  Widget tabBarLayout(
      {var primary,
      var titleColor,
      TabController? controller,
      var tab1,
      var tab2}) {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.zero,
      labelPadding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
      isScrollable: true,
      indicatorColor: primary,
      unselectedLabelStyle: TextStyle(color: titleColor),
      unselectedLabelColor: titleColor,
      labelColor: primary,
      controller: controller,
      tabs: [
        Tab(
          text: tab1,
        ),
        Tab(
          text: tab2,
        ),
      ],
    );
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
      title: NotificationStyle()
          .appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        NotificationWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}
