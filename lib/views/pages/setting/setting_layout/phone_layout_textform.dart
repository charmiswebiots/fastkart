import '../../../../config.dart';

class PhoneLayoutTextForm extends StatelessWidget {
  const PhoneLayoutTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return CommonTextFormField(
          obscureText: false,
          maxLength: 10,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          controller: settingCtrl.phone,
          onFieldSubmitted: (value) {
            SettingWidget().fieldFocusChange(context,
                settingCtrl.phoneFocus, settingCtrl.dateFocus);
          },
          focusNode: settingCtrl.phoneFocus,
          validator: (value) =>
              SettingValidation().checkPhoneValidation(value),
          text: SettingFont().phonelHint,
          borderColor: settingCtrl.appCtrl.appTheme.primary
              .withOpacity(.3),
          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
          suffixIcon: SettingStyle().phoneIconLayout(
              iconAssets.call,
              settingCtrl.appCtrl.appTheme.titleColor),
        );
      }
    );
  }
}
