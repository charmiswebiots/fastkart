
import '../../../../config.dart';

class UserNameTextForm extends StatelessWidget {
  final TextEditingController? username;
  final FocusNode? usernameFocus;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;

  const UserNameTextForm(
      {Key? key,
      this.username,
      this.usernameFocus,
      this.onFieldSubmitted,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CommonTextFormField(
        controller: username,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: usernameFocus,
        validator: validator,
        suffixIcon: Padding(
          padding:
              EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
          child: SignupStyle().commonImageLayout(
              image: iconAssets.profile,
              titleColor: appCtrl.appTheme.titleColor),
        ),
        text: SignupFont().fullName,
        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
        hintColor: appCtrl.appTheme.contentColor,
        fillcolor: appCtrl.appTheme.textBoxColor,
      );
    });
  }
}
