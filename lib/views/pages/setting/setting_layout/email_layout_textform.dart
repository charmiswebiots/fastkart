import '../../../../config.dart';

class EmailLayoutTextForm extends StatelessWidget {
  const EmailLayoutTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return CommonTextFormField(
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: settingCtrl.email,
          onFieldSubmitted: (value) {
            SettingWidget().fieldFocusChange(
                context,
                settingCtrl.userFocus,
                settingCtrl.passwordFocus);
          },
          focusNode: settingCtrl.userFocus,
          validator: (value) =>
              SettingValidation().checkIDValidation(value),
          text: SettingFont().emailHint,
          borderColor: settingCtrl.appCtrl.appTheme.primary
              .withOpacity(.3),
          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
          suffixIcon: Image.asset(
            iconAssets.atsign,
            color: settingCtrl.appCtrl.appTheme.titleColor,
          ),
        );
      }
    );
  }
}
