import 'package:fastkart/config.dart';

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
        builder: (ctrl) => Scaffold(
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
                        child: Column(
                          children: [
                            //continoue with phone layout
                            IconButtonWidget(
                              onTap: () => onboardCtrl.onBoardingRead(),
                              lefMargin: 15,
                              rightMargin: 15,
                              icon: iconAssets.mobileIcon,
                              textWidget: OnboardingFontStyle()
                                  .mulishtextLayout(
                                      text: OnboardingFont().continueWithPhone,
                                      color: onboardCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize: OnboardingFontSize.textSizeMedium,
                                      fontWeight: FontWeight.bold),
                              type: OnboardingFont().phone,
                            ),
                            const Space(0, 10),
                            //continoue with google layout
                            IconButtonWidget(
                              onTap: () => onboardCtrl.googleLogin(),
                              lefMargin: 15,
                              rightMargin: 15,
                              icon: iconAssets.google,
                              textWidget: OnboardingFontStyle()
                                  .mulishtextLayout(
                                      text: OnboardingFont().continueWithGoogle,
                                      color: onboardCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize: OnboardingFontSize.textSizeMedium,
                                      fontWeight: FontWeight.bold),
                              type: OnboardingFont().google,
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
                        ))
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
