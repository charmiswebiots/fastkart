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
              const Space(0, 15),
              //description text layout
              LoginStyle()
                  .descLayout(loginCtrl.appCtrl.appTheme.darkContentColor),
              const Space(0, 15),

              //login account text layout
              LoginStyle().loginText(loginCtrl.appCtrl.appTheme.titleColor),
              const Space(0, 15),

              //email textformfield layout
              usertextForm!,

              const Space(0, 12),
              // password layout
              passwordTextForm!,
              const Space(0, 10),
              //forgot password text layout
              Align(
                alignment: Alignment.centerRight,
                child: LoginWidget().forgotPasswordWidget(
                    color: loginCtrl.appCtrl.appTheme.darkContentColor),
              ),

              //signin button layout
              CustomButton(
                height: 40,
                title: LoginFont().signIn,
                color: loginCtrl.appCtrl.appTheme.primary,
                onTap: () => loginCtrl.signIn(context),
                fontColor: loginCtrl.appCtrl.appTheme.whiteColor,
              ),
              const Space(0, 15),

              //create user layout
              CreateNewUser(
                onTap: () => Get.toNamed(routeName.signup),
              ),
              const Space(0, 10),

              //signup with text layout
              const LoginWithLayout(
              ),
              const Space(0, 25),
              //continue with phone
              LoginStyle().socialButton(
                  titleColor: loginCtrl.appCtrl.appTheme.titleColor,
                  icon: iconAssets.mobileIcon,
                  type: LoginFont().phone,
                  text: LoginFont().continueWithPhone),
              const Space(0, 10),

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
