import 'package:fastkart/views/pages/signup/signup_layout/already_account.dart';

import '../../../../config.dart';

class SignUpBodyLayout extends StatelessWidget {
  final Widget? usertextForm;
  final Widget? passwordTextForm;
  final Widget? emailTextForm;
  final Widget? button;
  final dynamic formKey;
  final Widget? imageLayout;

  const SignUpBodyLayout(
      {Key? key,
      this.formKey,
      this.imageLayout,
      this.passwordTextForm,
      this.button,
      this.emailTextForm,
      this.usertextForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (signupCtrl) {
      return SignupWidget().bodyContainer(
          color: signupCtrl.appCtrl.appTheme.whiteColor,
          context: context,
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //logo image layout
                        SignupWidget().logoImage(signupCtrl.appCtrl.isTheme),
                        const Space(0, 18),
                        //description text layout
                        SignupStyle().descLayout(
                            signupCtrl.appCtrl.appTheme.darkContentColor),
                        const Space(0, 20),

                        //register account text layout
                        SignupStyle().registerAccountLayout(
                            signupCtrl.appCtrl.appTheme.titleColor),
                        const Space(0, 16),

                        //fullname textformfield layout
                        usertextForm!,
                        const Space(0, 13),

                        //email textformfield layout
                        emailTextForm!,

                        const Space(0, 13)
                      ]),
                  // password layout
                  passwordTextForm!,
                  const Space(0, 20),
                  //signup button layout
                  button!,
                  const Space(0, 25),

                  //already account widget
                  AlreadyAccount(
                      onTap: () => Get.back(),
                      color: signupCtrl.appCtrl.appTheme.darkContentColor),
                  const Space(0, 25),

                  //signup with text layout
                  const LoginWithLayout(),
                  const Space(0, 35),

                  //continue with phone layout
                  SignupStyle().socialButton(
                      icon: iconAssets.mobileIcon,
                      text: SignupFont().continueWithPhone,
                      type: SignupFont().phone,
                      titleColor: signupCtrl.appCtrl.appTheme.titleColor),
                  const Space(0, 15),

                  //continue with google layout
                  SignupStyle().socialButton(
                      icon: iconAssets.google,
                      text: SignupFont().continueWithGoogle,
                      type: SignupFont().google,
                      titleColor: signupCtrl.appCtrl.appTheme.titleColor,
                      onTap: () => signupCtrl.googleLogin())
                ],
              )));
    });
  }
}
