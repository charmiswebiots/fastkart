import 'package:fastkart/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return WillPopScope(
        onWillPop: () async {
          return Future(() => false);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: loginCtrl.appCtrl.appTheme.primary,
          body: AppComponent(
            child: GetBuilder<LoginController>(
              builder: (_) => SizedBox(
                height: AppScreenUtil().screenActualHeight(),
                child: Stack(
                  children: [
                    //background Image layout
                    LoginWidget().loginBackGroundImage(
                        imageAssets.backgroundImage, context),
                    //main body container
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        BodyLayout(
                          loginformKey: loginCtrl.loginformKey,
                          imageLayout: LoginWidget()
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
