import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginCtrl = Get.put(LoginController());

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
              builder: (_) => Container(
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
                          usertextForm: CommonTextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: loginCtrl.email,
                            onFieldSubmitted: (value) {
                              LoginWidget().fieldFocusChange(context,
                                  loginCtrl.userFocus, loginCtrl.passwordFocus);
                            },
                            focusNode: loginCtrl.userFocus,
                            validator: (value) =>
                                LoginValidation().checkIDValidation(value),
                            text: LoginFont().emailHint,
                            borderColor: loginCtrl.appCtrl.appTheme.primary
                                .withOpacity(.3),
                            hintColor: loginCtrl.appCtrl.appTheme.contentColor,
                            fillcolor: loginCtrl.appCtrl.appTheme.textBoxColor,
                            suffixIcon: LoginStyle().commonIcon(
                                isPassword: false,
                                color: loginCtrl.appCtrl.appTheme.titleColor),
                          ),
                          //password layout
                          passwordTextForm: CommonTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.none,
                            controller: loginCtrl.password,
                            focusNode: loginCtrl.passwordFocus,
                            obscureText: loginCtrl.passwordVisible,
                            validator: (value) => LoginValidation()
                                .checkPasswordValidation(value),
                            suffixIcon: InkWell(
                              onTap: () => loginCtrl.toggle(),
                              child: LoginStyle().commonIcon(
                                  isPassword: true,
                                  passwordVisible: loginCtrl.passwordVisible,
                                  color: loginCtrl.appCtrl.appTheme.titleColor),
                            ),
                            text: LoginFont().password,
                            borderColor: loginCtrl.appCtrl.appTheme.primary
                                .withOpacity(.3),
                            hintColor: loginCtrl.appCtrl.appTheme.contentColor,
                            fillcolor: loginCtrl.appCtrl.appTheme.textBoxColor,
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
