import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/pages/signup/util/signup_constants.dart';
import 'package:fastkart/views/pages/signup/util/signup_fontstyle.dart';
import 'package:fastkart/views/pages/signup/util/signup_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class SignUpScreen extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCtrl.appTheme.primary,
      body: Container(
        child: Stack(
          children: [
            //background Image layout
            SignupWidget()
                .signupBackGroundImage(imageAssets.backgroundImage, context),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //white body container layout
                SignupWidget().bodyContainer(
                    color: appCtrl.appTheme.whiteColor,
                    context: context,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //logo image layout
                                    Image.asset(imageAssets.smallLogoImage),
                                    Space(0, 18),

                                    //description text layout
                                    SignupFontStyle().nunitotextLayout(
                                        text: SignupFont().description,
                                        color:
                                            appCtrl.appTheme.darkContentColor,
                                        fontSize: 14),
                                    Space(0, 20),

                                    //register account text layout
                                    SignupFontStyle().mulishtextLayout(
                                        text: SignupFont().registerAccount,
                                        color: appCtrl.appTheme.titleColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    Space(0, 16),

                                    //fullname textformfiel layout
                                    SignupWidget().textFieldLayout(
                                      suffixIcon:
                                          Image.asset(iconAssets.profile),
                                      text: SignupFont().fullName,
                                      borderColor: appCtrl.appTheme.primary
                                          .withOpacity(.3),
                                      hintColor: appCtrl.appTheme.contentColor,
                                      fillcolor: appCtrl.appTheme.lightGray,
                                    ),
                                    Space(0, 13),

                                    //email textformfiel layout
                                    SignupWidget().textFieldLayout(
                                      text: SignupFont().emailHint,
                                      suffixIcon:
                                          Image.asset(iconAssets.atsign),
                                      borderColor: appCtrl.appTheme.primary
                                          .withOpacity(.3),
                                      hintColor: appCtrl.appTheme.contentColor,
                                      fillcolor: appCtrl.appTheme.lightGray,
                                    ),
                                    Space(0, 13),
                                  ],
                                ),

                                //email password layout
                                SignupWidget().textFieldLayout(
                                  suffixIcon: Image.asset(iconAssets.hide),
                                  text: SignupFont().password,
                                  borderColor:
                                      appCtrl.appTheme.primary.withOpacity(.3),
                                  hintColor: appCtrl.appTheme.contentColor,
                                  fillcolor: appCtrl.appTheme.lightGray,
                                ),
                                Space(0, 20),

                                //signup button layout
                                SignupWidget().signUpButton(
                                    color: appCtrl.appTheme.primary,
                                    context: context,
                                    fontColor: appCtrl.appTheme.whiteColor),
                                Space(0, 5),

                                //already account widget
                                SignupWidget().alreadyAccountWidget(
                                    onTap: () {
                                      Get.back();
                                    },
                                    color: appCtrl.appTheme.darkContentColor),
                                Space(0, 20),

                                //signup with text layout
                                SignupWidget().signupWithLayout(
                                    color: appCtrl.appTheme.contentColor,
                                    fontColor: appCtrl.appTheme.primary),
                                Space(0, 20),

                                //continoue with phone layout
                                IconButtonWidget(
                                  icon: iconAssets.mobileIcon,
                                  textWidget: SignupFontStyle()
                                      .mulishtextLayout(
                                          text: SignupFont().continueWithPhone,
                                          color: appCtrl.appTheme.titleColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                  type: SignupFont().phone,
                                ),
                                Space(0, 15),

                                //continoue with google layout
                                IconButtonWidget(
                                  icon: iconAssets.google,
                                  textWidget: SignupFontStyle()
                                      .mulishtextLayout(
                                          text: SignupFont().continueWithGoogle,
                                          color: appCtrl.appTheme.titleColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                  type: SignupFont().google,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                //continue as guest text layout
                SignupWidget()
                    .continueAsGuest(color: appCtrl.appTheme.titleColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
