import '../../../../config.dart';

class SettingBodyLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const SettingBodyLayout({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //user icon
            SettingStyle().userImageLayout(
                color: settingCtrl.appCtrl.appTheme.primary,
                context: context,
                image: imageAssets.usersquare,
                height: 50),
            const Space(0, 10),
            //user name text layout
            SettingWidget().userNameLayout(
                settingCtrl.appCtrl.appTheme.titleColor),
            const Space(0, 3),

            //user email text layout
            SettingStyle().userEmailLayout(
                settingCtrl.appCtrl.appTheme.darkContentColor),

            const Space(0, 20),
            //fullname textformfield layout
            const FullNameTextForm(),

            const Space(0, 15),
            //email textformfield layout
            const EmailLayoutTextForm(),

            const Space(0, 15),
            //phone textformfield layout
            const PhoneLayoutTextForm(),
            const Space(0, 15),
            //date textformfield layout
            const DateLayoutTextForm(),
            const Space(0, 15),
            // password layout
            const PasswordLayout(),
            const Space(0, 15),
            //Update Settings layout
            UpdateSettingButton(onTap: onTap)
          ],
        );
      }
    );
  }
}
