import '../../../../config.dart';

class SignUpBodyLayout extends StatelessWidget {
  Widget? usertextForm;
  Widget? passwordTextForm;
  Widget? emailTextForm;
  Widget? button;
  dynamic formKey;
  Widget? imageLayout;

  SignUpBodyLayout(
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
          formKey: formKey,
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
                    Space(0, 18),
                    //description text layout
                    SignupStyle()
                        .descLayout(signupCtrl.appCtrl.appTheme.darkContentColor),
                    Space(0, 20),

                    //register account text layout
                    SignupStyle().registerAccountLayout(
                        signupCtrl.appCtrl.appTheme.titleColor),
                    Space(0, 16),

                    //fullname textformfield layout
                    usertextForm!,
                    Space(0, 13),

                    //email textformfield layout
                    emailTextForm!,

                    Space(0, 13),
                  ],
                ),
                // password layout
                passwordTextForm!,

                Space(0, 20),

                //signup button layout
                button!,
                Space(0, 25),

                //already account widget
                SignupStyle().alreadyAccountWidget(
                    onTap: () => Get.back(),
                    color: signupCtrl.appCtrl.appTheme.darkContentColor),
                Space(0, 25),

                //signup with text layout
                SignupStyle().loginWithLayout(
                    color: signupCtrl.appCtrl.appTheme.contentColor,
                    fontColor: signupCtrl.appCtrl.appTheme.primary),
                Space(0, 35),

                //continue with phone layout
                SignupStyle().socialButton(
                    icon: iconAssets.mobileIcon,
                    text: SignupFont().continueWithPhone,
                    type: SignupFont().phone,
                    titleColor: signupCtrl.appCtrl.appTheme.titleColor),
                Space(0, 15),

                //continoue with google layout
                SignupStyle().socialButton(
                  icon: iconAssets.google,
                  text: SignupFont().continueWithGoogle,
                  type: SignupFont().google,
                  titleColor: signupCtrl.appCtrl.appTheme.titleColor,
                  onTap: () => signupCtrl.googleLogin(),
                ),
              ],
            ),
          ));
    });
  }
}
