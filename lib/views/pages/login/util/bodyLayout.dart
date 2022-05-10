import 'package:flutter/material.dart';
import '../../../../config.dart';

class BodyLayout extends StatelessWidget {
  Widget? usertextForm;
  Widget? passwordTextForm;
  dynamic loginformKey;
  Widget? imageLayout;

  BodyLayout({
    Key? key,
    this.usertextForm,
    this.passwordTextForm,
    this.loginformKey,
    this.imageLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return LoginStyle().bodyStyle(
        color: loginCtrl.appCtrl.appTheme.whiteColor,
        context: context,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //logo image layout
          imageLayout!,
          Space(0, 15),
          //description text layout
          LoginStyle().descLayout(loginCtrl.appCtrl.appTheme.darkContentColor),
          Space(0, 15),

          //login account text layout
          LoginStyle().loginText(loginCtrl.appCtrl.appTheme.titleColor),
          Space(0, 15),

          //email textformfield layout
          usertextForm!,

          Space(0, 12),
          // password layout
          passwordTextForm!,
          Space(0, 10),
          //forgot password text layout
          Align(
            alignment: Alignment.centerRight,
            child: LoginWidget().forgotPasswordWidget(
                color: loginCtrl.appCtrl.appTheme.darkContentColor),
          ),

          //signin button layout
          CustomButton(
            title: LoginFont().signIn,
            color: loginCtrl.appCtrl.appTheme.primary,
            onTap: () => loginCtrl.signIn(context),
            fontColor: loginCtrl.appCtrl.appTheme.whiteColor,
          ),

          Space(0, 15),

          //create user layout
          LoginWidget().createUserWidget(
              fontWeight: FontWeight.w600,
              onTap: () => Get.toNamed(routeName.signup),
              color: loginCtrl.appCtrl.appTheme.darkContentColor),
          Space(0, 10),

          //signup with text layout
          LoginWithLayout(
              fontWeight: FontWeight.w700,
              color: loginCtrl.appCtrl.appTheme.contentColor,
              fontColor: loginCtrl.appCtrl.appTheme.primary),
          Space(0, 25),
          //continue with phone
          LoginStyle().socialButton(
              titleColor: loginCtrl.appCtrl.appTheme.titleColor,
              icon: iconAssets.mobileIcon,
              type: LoginFont().phone,
              text: LoginFont().continueWithPhone),
          Space(0, 10),

          // continue with google layout
          LoginStyle().socialButton(
            titleColor: loginCtrl.appCtrl.appTheme.titleColor,
            icon: iconAssets.google,
            type: LoginFont().google,
            text: LoginFont().continueWithGoogle,
            onTap: () =>loginCtrl.appCtrl.googleLogin(),
          ),
        ]),
      );
    });
  }
}
