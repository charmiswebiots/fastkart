import '../../config.dart';

class DrawerScreen extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (_) => ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
            bottomRight: Radius.circular(AppScreenUtil().borderRadius(20))),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: Container(
            color: appCtrl.appTheme.whiteColor,
            width: MediaQuery.of(context).size.width *
                AppScreenUtil().screenWidth(0.75),
            child: Drawer(
                backgroundColor: appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(8)),
                          child: Column(
                            children: [
                              //Drawer header
                              DrawerCustomHeader(
                                isYourAccount: false,
                                  color: appCtrl.appTheme.whiteColor,
                                  borderRadius: 50,
                                  image: imageAssets.usersquare,
                                  imageHeight: 50,
                                  userName: DrawerFont().andreaJoanne,
                                  userEmail: DrawerFont().userEmail,
                                  nameFontSize: 14,
                                  emailFontSize: 12),

                              //divider layout
                              DrawerStyle().dividerLineLayout(
                                  height: 48,
                                  horizontalPadding: 10,
                                  color: appCtrl.appTheme.borderGray),

                              //drawer list
                              ...appCtrl.drawerList.asMap().entries.map((e) {
                                return CommonDrawerList(

                                    index: e.key,
                                    image: e.value['icon'],
                                    title: e.value['title'],
                                    onToggle: (val) {
                                      appCtrl.isTheme = val;
                                      appCtrl.update();
                                      ThemeService().switchTheme(val);
                                    },
                                    height: 20,
                                    fontSize: 14);
                              }).toList(),
                              const Space(0, 200)
                            ],
                          ),
                        ),
                      ],
                    ),

                    //CONTACT US LAYOUT
                    const ContactUsLayout()
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
