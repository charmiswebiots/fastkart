import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:fastkart/views/pages/login/util/login_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
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
            //background Image layout
            LoginWidget()
                .loginBackGroundImage(imageAssets.backgroundImage, context),
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
                                    //logo image layout
                                    Image.asset(imageAssets.smallLogoImage),
                                    Space(0, 18),

                                    //description text layout
                                    LoginFontStyle().nunitotextLayout(
                                        text: LoginFont().description,
                                        color:
                                            appCtrl.appTheme.darkContentColor,
                                        fontSize: textSizeSMedium),
                                    Space(0, 20),

                                    //login account text layout
                                    LoginFontStyle().mulishtextLayout(
                                        text: LoginFont().loginAccount,
                                        color: appCtrl.appTheme.titleColor,
                                        fontSize: textSizeMedium,
                                        fontWeight: FontWeight.w700),
                                    Space(0, 16),

                                    //email textformfiel layout
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

                                //email password layout
                                LoginWidget().textFieldLayout(
                                  suffixIcon: Image.asset(iconAssets.hide),
                                  text: LoginFont().password,
                                  borderColor:
                                      appCtrl.appTheme.primary.withOpacity(.3),
                                  hintColor: appCtrl.appTheme.contentColor,
                                  fillcolor: appCtrl.appTheme.lightGray,
                                ),
                                Space(0, 10),

                                //forgot password text layout
                                LoginWidget().forgotPasswordWidget(
                                    color: appCtrl.appTheme.darkContentColor),

                                //signin button layout
                                LoginWidget().signInButton(
                                    color: appCtrl.appTheme.primary,
                                    context: context,
                                    fontColor: appCtrl.appTheme.whiteColor,
                                    onTap: () =>
                                        Get.toNamed(routeName.error404page)),
                                Space(0, 20),

                                //create user layout
                                LoginWidget().createUserWidget(
                                    onTap: () {
                                      Get.toNamed(routeName.signup);
                                    },
                                    color: appCtrl.appTheme.darkContentColor),
                                Space(0, 25),

                                //signup with text layout
                                LoginWidget().signupWithLayout(
                                    color: appCtrl.appTheme.contentColor,
                                    fontColor: appCtrl.appTheme.primary),
                                Space(0, 35),

                                //continoue with phone layout
                                IconButtonWidget(
                                  icon: iconAssets.mobileIcon,
                                  type: LoginFont().phone,
                                  textWidget: LoginFontStyle().mulishtextLayout(
                                      text: LoginFont().continueWithPhone,
                                      color: appCtrl.appTheme.titleColor,
                                      fontSize: textSizeMedium,
                                      fontWeight: FontWeight.bold),
                                ),
                                Space(0, 15),

                                //continoue with google layout
                                IconButtonWidget(
                                  icon: iconAssets.google,
                                  textWidget: LoginFontStyle().mulishtextLayout(
                                      text: LoginFont().continueWithGoogle,
                                      color: appCtrl.appTheme.titleColor,
                                      fontSize: textSizeMedium,
                                      fontWeight: FontWeight.bold),
                                  type: LoginFont().google,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                //continue as guest text layout
                LoginWidget()
                    .continueAsGuest(color: appCtrl.appTheme.titleColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
