import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/onboarding_controller.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_constants.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_fontstyle.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  var onboardCtrl = Get.put(OnboardingController());
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
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    //background image layout
                    OnboardingWidget().backgroundImage(
                        image: imageAssets.onboardingImage,
                        height: 2.3,
                        context: context),
                    Space(0, 5),
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
                                      fontSize: textSizeMedium,
                                      fontWeight: FontWeight.bold),
                              type: OnboardingFont().phone,
                            ),
                            Space(0, 10),
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
                                      fontSize: textSizeMedium,
                                      fontWeight: FontWeight.bold),
                              type: OnboardingFont().google,
                            ),
                            Space(0, 10),
                            InkWell(
                              onTap: () => onboardCtrl.onBoardingRead(),
                              child: OnboardingFontStyle().mulishtextLayout(
                                  text: OnboardingFont().skip,
                                  color: onboardCtrl.appCtrl.appTheme.primary,
                                  fontSize: textSizexSmall,
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
