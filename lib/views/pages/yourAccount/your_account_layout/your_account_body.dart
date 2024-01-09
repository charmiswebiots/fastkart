import '../../../../config.dart';

class YourAccountBody extends StatelessWidget {
  const YourAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourAccountController>(
      builder: (yourAccountCtrl) {
        return Column(
          crossAxisAlignment: yourAccountCtrl.appCtrl.isRTL ?CrossAxisAlignment.end : CrossAxisAlignment.start,
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
              return e.key == 12
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
                  onToggleRtl: (val) {
                    yourAccountCtrl.appCtrl.isRTL = val;
                    yourAccountCtrl.appCtrl.update();
                  },
                  onTap: () => yourAccountCtrl.pageNameTap(
                      e.key, context));
            }).toList(),
            const Space(0, 200)
          ],
        );
      }
    );
  }
}
