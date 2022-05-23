import '../../../../config.dart';

class PasswordLayout extends StatelessWidget {
  const PasswordLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (settingCtrl) {
      return Container(
        padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(12),
          bottom: AppScreenUtil().screenHeight(12),
          right: AppScreenUtil().screenWidth(settingCtrl.appCtrl.isRTL ? 10 :0)
        ),
        decoration: BoxDecoration(
            color: settingCtrl.appCtrl.appTheme.textBoxColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            border: Border.all(color: settingCtrl.appCtrl.appTheme.primary)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
              child: SettingStyle().changePassWord(
                  color: settingCtrl.appCtrl.appTheme.titleColor),
            ),
            const Space(0, 5),
            CommonTextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.none,
              controller: settingCtrl.password,
              focusNode: settingCtrl.passwordFocus,
              obscureText: settingCtrl.passwordVisible,
              validator: (value) =>
                  SettingValidation().checkPasswordValidation(value),
              suffixIcon: InkWell(
                onTap: () => settingCtrl.toggle(),
                child: SettingStyle().profileAndPasswordIconLayout(
                    iconAssets.lock, settingCtrl.appCtrl.appTheme.titleColor),
              ),
              text: LoginFont().password,
              borderColor: settingCtrl.appCtrl.appTheme.textBoxColor,
              hintColor: settingCtrl.appCtrl.appTheme.contentColor,
              fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
            )
          ],
        ),
      );
    });
  }
}
