import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/onboarding_screen/social_button.dart';

class OnBoardingScreen extends StatelessWidget {
  final onboardCtrl = Get.put(OnboardingController());
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GetBuilder<AppController>(
        builder: (ctrl) => Directionality(
          textDirection: ctrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            body: AppComponent(
              child: GetBuilder<OnboardingController>(builder: (_) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      //background image layout
                      OnboardingWidget().backgroundImage(
                          image: imageAssets.onboardingImage,
                          height: 2.3,
                          context: context),
                      const Space(0, 5),
                      //image, title and description layout
                      OnboardingWidget().layout(
                          context: context,
                          isTheme: onboardCtrl.appCtrl.isTheme,
                          titleColor: onboardCtrl.appCtrl.appTheme.titleColor,
                          contentColor:
                              onboardCtrl.appCtrl.appTheme.contentColor),
                      //social login layout
                      OnboardingWidget().socialLoginLayout(
                          context: context,
                          child: const SocialButton())
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
