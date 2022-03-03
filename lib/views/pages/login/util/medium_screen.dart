import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:fastkart/views/pages/login/util/login_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appCtrl = Get.isRegistered<AppController>()
        ? Get.find<AppController>()
        : Get.put(AppController());

    return Container(
      height: AppScreenUtil().screenActualHeight(),
      child: Stack(
        children: [
          //background Image layout
          LoginWidget()
              .loginBackGroundImage(imageAssets.backgroundImage, context),
          //main body container
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              LoginWidget().bodyContainer(
                  color: appCtrl.appTheme.whiteColor,
                  context: context,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / AppScreenUtil().screenHeight(1.70),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //logo image layout
                              Image.asset(imageAssets.smallLogoImage),
                              Space(0, 10),

                              //description text layout
                              LoginFontStyle().nunitotextLayout(
                                  text: LoginFont().description,
                                  color: appCtrl.appTheme.darkContentColor,
                                  fontSize: textSizeSMedium),
                              Space(0, 10),

                              //login account text layout
                              LoginFontStyle().mulishtextLayout(
                                  text: LoginFont().loginAccount,
                                  color: appCtrl.appTheme.titleColor,
                                  fontSize: textSizeMedium,
                                  fontWeight: FontWeight.w700),
                              Space(0, 12),

                              //email textformfiel layout
                              LoginWidget().textFieldLayout(
                                text: LoginFont().emailHint,
                                suffixIcon: Image.asset(iconAssets.atsign),
                                borderColor:
                                appCtrl.appTheme.primary.withOpacity(.3),
                                hintColor: appCtrl.appTheme.darkContentColor,
                                fillcolor: appCtrl.appTheme.lightGray,
                              ),
                              Space(0, 11), //email password layout
                              LoginWidget().textFieldLayout(
                                suffixIcon: Image.asset(iconAssets.hide),
                                text: LoginFont().password,
                                borderColor:
                                appCtrl.appTheme.primary.withOpacity(.3),
                                hintColor: appCtrl.appTheme.darkContentColor,
                                fillcolor: appCtrl.appTheme.lightGray,
                              ),
                              Space(0, 6),

                              //forgot password text layout
                              Align(
                                alignment: Alignment.centerRight,
                                child: LoginWidget().forgotPasswordWidget(
                                    color: appCtrl.appTheme.darkContentColor),
                              ),

                              //signin button layout
                              LoginWidget().signInButton(
                                  color: appCtrl.appTheme.primary,
                                  context: context,
                                  fontColor: appCtrl.appTheme.whiteColor,
                                  onTap: () => Get.toNamed(routeName.home)),
                              Space(0, 16),

                              //create user layout
                              LoginWidget().createUserWidget(
                                  onTap: () {
                                    Get.toNamed(routeName.signup);
                                  },
                                  color: appCtrl.appTheme.darkContentColor),
                              Space(0, 11),

                              //signup with text layout
                              LoginWidget().signupWithLayout(
                                  color: appCtrl.appTheme.contentColor,
                                  fontColor: appCtrl.appTheme.primary),
                            ]),
                      ),
                      IconButtonWidget(
                        icon: iconAssets.mobileIcon,
                        type: LoginFont().phone,
                        textWidget: LoginFontStyle().mulishtextLayout(
                            text: LoginFont().continueWithPhone,
                            color: appCtrl.appTheme.titleColor,
                            fontSize: textSizeMedium,
                            fontWeight: FontWeight.bold),
                      ),
                      Space(0, 6),

                      // continoue with google layout
                      IconButtonWidget(
                        icon: iconAssets.google,
                        textWidget: LoginFontStyle().mulishtextLayout(
                            text: LoginFont().continueWithGoogle,
                            color: appCtrl.appTheme.titleColor,
                            fontSize: textSizeMedium,
                            fontWeight: FontWeight.bold),
                        type: LoginFont().google,
                      )
                    ],
                  )),
              // continue as guest text layout
              LoginWidget()
                  .continueAsGuest(color: appCtrl.appTheme.titleColor)
            ],
          )
        ],
      ),
    );
  }
}
