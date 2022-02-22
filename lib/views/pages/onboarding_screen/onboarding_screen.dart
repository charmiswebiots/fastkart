import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_constants.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_fontstyle.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/onboarding_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            OnboardingWidget().backgroundImage(
                image: imageAssets.onboardingImage,
                height: 2.3,
                context: context),
            Space(0, 15),
            OnboardingWidget().smallLogoImage(
                image: imageAssets.smallLogoImage, context: context),
            Space(0, 2),
            OnboardingFontStyle().quicksandtextLayout(
                text: OnboardingFont().getSafeDelivery,
                color: appCtrl.appTheme.titleColor,
                fontSize: textSizeNormal,
                fontWeight: FontWeight.w500),
            Space(0, 10),
            OnboardingFontStyle().nunitotextLayout(
                text: OnboardingFont().description,
                color: appCtrl.appTheme.contentColor,
                fontSize: textSizeSMedium,
                fontWeight: FontWeight.normal),
            Space(0, 10),
            IconButtonWidget(
              icon: iconAssets.mobileIcon,
              textWidget: OnboardingFontStyle().mulishtextLayout(
                  text: OnboardingFont().continueWithPhone,
                  color: appCtrl.appTheme.titleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              type: OnboardingFont().phone,
            ),
            Space(0, 15),
            IconButtonWidget(
              icon: iconAssets.google,
              textWidget: OnboardingFontStyle().mulishtextLayout(
                  text: OnboardingFont().continueWithGoogle,
                  color: appCtrl.appTheme.titleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              type: OnboardingFont().google,
            ),
          ],
        ),
      ),
    );
  }
}
