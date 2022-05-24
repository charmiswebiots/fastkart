
import '../../../../config.dart';

class DateLayoutTextForm extends StatelessWidget {
  const DateLayoutTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return CommonTextFormField(
          obscureText: false,
          readOnly: true,
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          controller: settingCtrl.dateCtrl,
          onFieldSubmitted: (value) {
            SettingWidget().fieldFocusChange(context,
                settingCtrl.dateFocus, settingCtrl.phoneFocus);
          },
          focusNode: settingCtrl.dateFocus,
          validator: (value) =>
              SettingValidation().checkIDValidation(value),
          text: SettingFont().dateHint,
          borderColor: settingCtrl.appCtrl.appTheme.primary
              .withOpacity(.3),
          hintColor: settingCtrl.appCtrl.appTheme.contentColor,
          fillcolor: settingCtrl.appCtrl.appTheme.textBoxColor,
          suffixIcon: SettingStyle().phoneIconLayout(
              iconAssets.calendar,
              settingCtrl.appCtrl.appTheme.titleColor),
        );
      }
    );
  }
}
