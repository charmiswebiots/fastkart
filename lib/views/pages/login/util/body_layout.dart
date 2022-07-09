import 'package:fastkart/utilities/responsive_layout.dart';

import '../../../../config.dart';

class BodyLayout extends StatelessWidget {
  final Widget? usertextForm;
  final Widget? passwordTextForm;
  final Key? loginformKey;
  final Widget? imageLayout;

  const BodyLayout({
    Key? key,
    this.usertextForm,
    this.passwordTextForm,
    this.loginformKey,
    this.imageLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<LoginController>(builder: (loginCtrl) {
        return LoginBodyStyleLayout(
          color: loginCtrl.appCtrl.appTheme.whiteColor,
          child: Form(
            key: loginformKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //logo image layout
              imageLayout!,
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 6)
                      : const Space(0, 10),
              //description text layout
              LoginStyle()
                  .descLayout(loginCtrl.appCtrl.appTheme.darkContentColor),
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 6)
                      : const Space(0, 10),

              //login account text layout
              LoginStyle().loginText(loginCtrl.appCtrl.appTheme.titleColor),
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 6)
                      : const Space(0, 10),

              //email textformfield layout
              usertextForm!,
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 6)
                      : const Space(0, 10),
              // password layout
              passwordTextForm!,
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 5)
                      : const Space(0, 8),
              //forgot password text layout
              Align(
                alignment: Alignment.centerRight,
                child: LoginWidget().forgotPasswordWidget(
                    color: loginCtrl.appCtrl.appTheme.darkContentColor),
              ),

              //signin button layout
              CustomButton(
                height: 45,
                title: LoginFont().signIn,
                color: loginCtrl.appCtrl.appTheme.primary,
                onTap: () => loginCtrl.signIn(context),
                fontColor: loginCtrl.appCtrl.appTheme.whiteColor,
              ),
                  ResponsiveWidget.isSmallScreen(context)
                      ? const Space(0, 5)
                      : const Space(0, 8),
              //create user layout
              CreateNewUser(
                onTap: () => Get.toNamed(routeName.signup),
              ),
                  ResponsiveWidget.isSmallScreen(context) ? const Space(0, 5) :const Space(0, 8),

              //signup with text layout
              const LoginWithLayout(),
              ResponsiveWidget.isSmallScreen(context)
                  ? const Space(0, 15)
                  : const Space(0, 25),
              //continue with phone
              LoginStyle().socialButton(
                  titleColor: loginCtrl.appCtrl.appTheme.titleColor,
                  icon: iconAssets.mobileIcon,
                  type: LoginFont().phone,
                  text: LoginFont().continueWithPhone),
              const Space(0, 5),

              // continue with google layout
              LoginStyle().socialButton(
                titleColor: loginCtrl.appCtrl.appTheme.titleColor,
                icon: iconAssets.google,
                type: LoginFont().google,
                text: LoginFont().continueWithGoogle,
                onTap: () => loginCtrl.appCtrl.googleLogin(),
              ),
            ]),
          ),
        );
      });
    });
  }
}
