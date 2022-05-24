import '../../../../config.dart';

class SignupMainLayout extends StatelessWidget {
  final dynamic formKey;
  final GestureTapCallback? onTap;
  const SignupMainLayout({Key? key,this.onTap,this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignupController>(
      builder: (signupCtrl) {
        return SignUpBodyLayout(
          formKey: formKey,
          usertextForm: UserNameTextForm(
            username: signupCtrl.username,
            usernameFocus: signupCtrl.usernameFocus,
            onFieldSubmitted: (value) {
              SignupWidget().fieldFocusChange(
                  context,
                  signupCtrl.usernameFocus,
                  signupCtrl.emailFocus);
            },
            validator: (value) => SignupValidation()
                .checkUserNameValidation(value),
          ),
          passwordTextForm: PasswordTextForm(
            password: signupCtrl.password,
            passwordFocus: signupCtrl.passwordFocus,
            passwordVisible: signupCtrl.passwordVisible,
            validator: (value) => SignupValidation()
                .checkPasswordValidation(value),
            onTap: () {
              signupCtrl.toggle();
            },
          ),
          emailTextForm: EmailTextForm(
            email: signupCtrl.email,
            emailFocus: signupCtrl.emailFocus,
            onFieldSubmitted: (value) {
              SignupWidget().fieldFocusChange(
                  context,
                  signupCtrl.emailFocus,
                  signupCtrl.passwordFocus);
            },
            validator: (value) =>
                SignupValidation().checkIDValidation(value),
          ),
          button: CustomButton(
              height: 45,
              title: SignupFont().signup,
              color: signupCtrl.appCtrl.appTheme.primary,
              fontColor:
              signupCtrl.appCtrl.appTheme.whiteColor,
              onTap: onTap),
        );
      }
    );
  }
}
