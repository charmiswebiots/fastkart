import '../../../../config.dart';

class PasswordTextForm extends StatelessWidget {
  final TextEditingController? password;
  final FocusNode? passwordFocus;
  final FormFieldValidator<String>? validator;
  final bool? passwordVisible;
  final GestureTapCallback? onTap;

  const PasswordTextForm(
      {Key? key,
        this.password,
        this.passwordFocus,
        this.validator,this.passwordVisible,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return  CommonTextFormField(
        controller: password,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.none,
        obscureText: passwordVisible!,
        focusNode: passwordFocus,
        validator: validator,
        suffixIcon: InkWell(
            onTap:onTap,
            child: Image.asset(
                passwordVisible!
                    ? iconAssets.hide
                    : iconAssets.view,
                color: appCtrl.appTheme.titleColor)),
        text: SignupFont().password,
        borderColor:
        appCtrl.appTheme.primary.withOpacity(.3),
        hintColor: appCtrl.appTheme.contentColor,
        fillcolor: appCtrl.appTheme.textBoxColor,
      );
    });
  }
}
