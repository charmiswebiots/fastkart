import '../../../config.dart';

class YourAccount extends StatelessWidget {
  final yourAccountCtrl = Get.put(YourAccountController());

  YourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<YourAccountController>(builder: (_) {
        return Scaffold(
          backgroundColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
          appBar: YourAccountWidget().appBarLayout(
              bgColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
              titleColor: yourAccountCtrl.appCtrl.appTheme.titleColor,
              text: YourAccountFont().yourAccount,
              onTap: () => yourAccountCtrl.goToHome()),
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: yourAccountCtrl.appCtrl.selectedIndex,
            onTap: (val) => yourAccountCtrl.bottomNavigationClick(val),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Drawer header
                      DrawerCustomHeader(
                          color: yourAccountCtrl
                              .appCtrl.appTheme.wishtListBoxColor,
                          image: imageAssets.usersquare,
                          imageHeight: 50,
                          userName: YourAccountFont().andreaJoanne,
                          userEmail: YourAccountFont().userEmail,
                          isYourAccount: true,
                          nameFontSize: 14,
                          emailFontSize: 12),

                      //divider layout
                      YourAccountStyle().dividerLineLayout(
                          color: yourAccountCtrl.appCtrl.appTheme.borderGray),

                      //drawer list
                      ...AppArray().drawerList.asMap().entries.map((e) {
                        return e.key == 10
                            ? LogoutButton(
                                text: e.value['title'],
                                onTap: () => yourAccountCtrl.logout())
                            : YourAccountCommonList(
                                indexKey: e.key,
                                data: e.value,
                                onToggle: (val) {
                                  yourAccountCtrl.appCtrl.isTheme = val;
                                  yourAccountCtrl.appCtrl.update();
                                  ThemeService().switchTheme(val);
                                },
                                onTap: () => yourAccountCtrl.pageNameTap(
                                    e.key, context));
                      }).toList(),
                      const Space(0, 200)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
