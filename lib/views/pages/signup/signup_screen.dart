import '../../../config.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var signupCtrl = Get.put(SignupController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<SignupController>(
          builder: (controller) => Scaffold(
            backgroundColor: signupCtrl.appCtrl.appTheme.primary,
            body: Container(
                height: AppScreenUtil().screenActualHeight(),
                child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                      return false;
                    },
                    child: Stack(
                      children: [
                        //background Image layout
                        SignupWidget().signupBackGroundImage(
                            imageAssets.backgroundImage, context),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            //white body container layout
                            SignUpBodyLayout(
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
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      signupCtrl.signInClick(context: context);
                                    }
                                  }),
                            ),
                            //continue as guest text layout
                            SignupWidget().continueAsGuest(
                                color: signupCtrl.appCtrl.appTheme.titleColor)
                          ],
                        )
                      ],
                    ))),
          ),
        ),
      );
    });
  }
}
