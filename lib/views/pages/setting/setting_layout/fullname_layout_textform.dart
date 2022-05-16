import '../../../../config.dart';

class FullNameTextForm extends StatelessWidget {
  const FullNameTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return CommonTextFormField(
          obscureText: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: settingCtrl.username,
          onFieldSubmitted: (value) {
            SettingWidget().fieldFocusChange(
                context,
                settingCtrl.usernameFocus,
                settingCtrl.userFocus);
          },
          focusNode: settingCtrl.usernameFocus,
          validator: (value) =>
              LoginValidation().checkIDValidation(value),
          text: SettingFont().fullName,
          borderColor: settingCtrl.appCtrl.appTheme.primary
              .withOpacity(.3),
          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
          suffixIcon: SettingStyle()
              .profileAndPasswordIconLayout(iconAssets.profile,
              settingCtrl.appCtrl.appTheme.titleColor),
        );
      }
    );
  }
}
