import '../../../../config.dart';

class LoginMainLayout extends StatelessWidget {
  const LoginMainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginCtrl) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BodyLayout(
              loginformKey: loginCtrl.loginformKey,
              imageLayout: LoginStyle()
                  .logoImage(loginCtrl.appCtrl.isTheme),
              //user layout
              usertextForm: EmailTextForm(
                email: loginCtrl.email,
                emailFocus: loginCtrl.userFocus,
                onFieldSubmitted: (value) {
                  SignupWidget().fieldFocusChange(
                      context,
                      loginCtrl.userFocus,
                      loginCtrl.passwordFocus);
                },
                validator: (value) =>
                    SignupValidation().checkIDValidation(value),
              ),
              //password layout
              passwordTextForm:PasswordTextForm(
                password: loginCtrl.password,
                passwordFocus: loginCtrl.passwordFocus,
                passwordVisible: loginCtrl.passwordVisible,
                validator: (value) => SignupValidation()
                    .checkPasswordValidation(value),
                onTap: () {
                  loginCtrl.toggle();
                },
              ),
            ),
            // continue as guest text layout
            LoginWidget().continueAsGuest(
                color: loginCtrl.appCtrl.appTheme.titleColor)
          ],
        );
      }
    );
  }
}
