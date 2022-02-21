import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:fastkart/views/pages/login/util/login_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class LoginScreen extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCtrl.appTheme.primary,
      body: Container(
        child: Stack(
          children: [
            //background Image
           LoginWidget().loginBackGroundImage(imageAssets.backgroundImage, context),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                LoginWidget().bodyContainer(
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
                                    Image.asset(imageAssets.smallLogoImage),
                                    Space(0, 18),
                                    LoginFontStyle().nunitotextLayout(
                                        text: LoginFont().description,
                                        color:
                                            appCtrl.appTheme.darkContentColor,
                                        fontSize: 14),
                                    Space(0, 20),
                                    LoginFontStyle().mulishtextLayout(
                                        text: LoginFont().loginAccount,
                                        color: appCtrl.appTheme.titleColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    Space(0, 16),
                                    LoginWidget().textFieldLayout(
                                      text: LoginFont().emailHint,
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
                                LoginWidget().textFieldLayout(
                                  suffixIcon: Image.asset(iconAssets.hide),
                                  text: LoginFont().password,
                                  borderColor:
                                      appCtrl.appTheme.primary.withOpacity(.3),
                                  hintColor: appCtrl.appTheme.contentColor,
                                  fillcolor: appCtrl.appTheme.lightGray,
                                ),
                                Space(0, 5),
                                LoginWidget().forgotPasswordWidget(
                                    color: appCtrl.appTheme.darkContentColor),
                                LoginWidget().signInButton(
                                    color: appCtrl.appTheme.primary,
                                    context: context,
                                    fontColor: appCtrl.appTheme.whiteColor),
                                Space(0, 5),
                                LoginWidget().createUserWidget(
                                  onTap: (){
Get.toNamed(routeName.signup);
                                  },
                                    color: appCtrl.appTheme.darkContentColor),
                                Space(0, 20),
                                LoginWidget().signupWithLayout(
                                    color: appCtrl.appTheme.contentColor,
                                    fontColor: appCtrl.appTheme.primary),
                                Space(0, 20),
                                LoginWidget().socialLoginButton(
                                  containerColor: appCtrl.appTheme.lightGray,
                                  icon: iconAssets.mobileIcon,
                                  text: LoginFont().continueWithPhone,
                                ),
                                Space(0, 15),
                                LoginWidget().socialLoginButton(
                                  containerColor: appCtrl.appTheme.lightGray,
                                  icon: iconAssets.google,
                                  text: LoginFont().continueWithGoogle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
               LoginWidget().continueAsGuest(color: appCtrl.appTheme.titleColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
