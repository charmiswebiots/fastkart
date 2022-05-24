import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_style.dart';

import '../../../config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (onboardCtrl) {
        return Column(
          children: [
            //continue with phone
            OnboardingStyle().socialButton(
                titleColor: onboardCtrl.appCtrl.appTheme.titleColor,
                icon: iconAssets.mobileIcon,
                type: LoginFont().phone,
                text: LoginFont().continueWithPhone),
            const Space(0, 10),

            // continue with google layout
            OnboardingStyle().socialButton(
              titleColor: onboardCtrl.appCtrl.appTheme.titleColor,
              icon: iconAssets.google,
              type: LoginFont().google,
              text: LoginFont().continueWithGoogle,
              onTap: () => onboardCtrl.appCtrl.googleLogin(),
            ),
            const Space(0, 10),
            InkWell(
              onTap: () => onboardCtrl.onBoardingRead(),
              child: OnboardingFontStyle().mulishtextLayout(
                  text: OnboardingFont().skip,
                  color: onboardCtrl.appCtrl.appTheme.primary,
                  fontSize: OnboardingFontSize.textSizeSmall,
                  textDecoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            )
          ],
        );
      }
    );
  }
}
