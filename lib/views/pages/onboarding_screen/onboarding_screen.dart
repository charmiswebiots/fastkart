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
    return WillPopScope(
      onWillPop: ()async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //background image layout
              OnboardingWidget().backgroundImage(
                  image: imageAssets.onboardingImage,
                  height: 2.3,
                  context: context),
              Space(0, 5),

             Container(
               height: MediaQuery.of(context).size.height /3.1,
               child: Column(
                 children: [
                   //logo layout
                   OnboardingWidget().smallLogoImage(
                       image: imageAssets.smallLogoImage, context: context),
                   Space(0, 2),

                   //get safe delivery text layout
                   OnboardingFontStyle().nunitoAndQuicksandtextLayout(
                       text: OnboardingFont().getSafeDelivery,
                       color: appCtrl.appTheme.titleColor,
                       fontSize: textSizeNormal,
                       fontWeight: FontWeight.w500,type: 'quicksand'),
                   Space(0, 5),

                   //description layout
                   OnboardingFontStyle().nunitoAndQuicksandtextLayout(
                       text: OnboardingFont().description,
                       color: appCtrl.appTheme.contentColor,
                       fontSize: textSizeSMedium,
                       fontWeight: FontWeight.normal,type: 'nunito'),
                 ],
               ),
             ),

           Container(
             height: MediaQuery.of(context).size.height / 4.50,
             padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
             child: Column(
               children: [
                 //continoue with phone layout
                 IconButtonWidget(
                   lefMargin: 15,
                   rightMargin: 15,
                   icon: iconAssets.mobileIcon,
                   textWidget: OnboardingFontStyle().mulishtextLayout(
                       text: OnboardingFont().continueWithPhone,
                       color: appCtrl.appTheme.titleColor,
                       fontSize: textSizeMedium,
                       fontWeight: FontWeight.bold),
                   type: OnboardingFont().phone,
                 ),
                 Space(0, 10),

                 //continoue with google layout
                 IconButtonWidget(
                   lefMargin: 15,
                   rightMargin: 15,
                   icon: iconAssets.google,
                   textWidget: OnboardingFontStyle().mulishtextLayout(
                       text: OnboardingFont().continueWithGoogle,
                       color: appCtrl.appTheme.titleColor,
                       fontSize: textSizeMedium,
                       fontWeight: FontWeight.bold),
                   type: OnboardingFont().google,
                 ),
               ],
             ),
           )
            ],
          ),
        ),
      ),
    );
  }
}
