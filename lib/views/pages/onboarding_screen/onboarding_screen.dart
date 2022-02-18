import 'package:fastkart/app_extensions.dart';
import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/image_layout/background_image.dart';
import 'package:fastkart/views/pages/onboarding_screen/font_text_name.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/button_widget.dart';
import 'package:fastkart/views/pages/onboarding_screen/util/text_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            BackgroundImage(image: imageAssets.onboardingImage,height: 2.3,),
            Space(0, 15),
            Image.asset(imageAssets.smallLogoImage,width: MediaQuery.of(context).size.width,),
            Space(0, 2),
            QuickSandTextWidget(text: getSafeDelivery,),
            Space(0, 10),
            NunitoSansTextWidget(text: description,),
            Space(0, 10),
            ButtonWidget(icon: iconAssets.mobileIcon,text: continueWithPhone,type: phone,),
            Space(0, 15),
            ButtonWidget(icon: iconAssets.google,text: continueWithGoogle,type: google,),
          ],
        ),
      ),
    );
  }
}
