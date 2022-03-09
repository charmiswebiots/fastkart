import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/login_controller.dart';
import 'package:fastkart/views/pages/login/util/login_constants.dart';
import 'package:fastkart/views/pages/login/util/login_fontstyle.dart';
import 'package:fastkart/views/pages/login/util/login_validation.dart';
import 'package:fastkart/views/pages/login/util/login_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginCtrl = Get.put(LoginController());
    var appCtrl = Get.isRegistered<AppController>()
        ? Get.find<AppController>()
        : Get.put(AppController());
    return GetBuilder<LoginController>(
      builder: (_) => Container(
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
                    child: Form(
                      key: loginCtrl.loginformKey,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height /
                                AppScreenUtil().screenHeight(1.28),
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
                                      fontSize: textSizeSmall),
                                  Space(0, 8),

                                  //login account text layout
                                  LoginFontStyle().mulishtextLayout(
                                      text: LoginFont().loginAccount,
                                      color: appCtrl.appTheme.titleColor,
                                      fontSize: textSizeMedium,
                                      fontWeight: FontWeight.w700),
                                  Space(0, 10),

                                  //email textformfield layout
                                  LoginWidget().textFieldLayout(
                                    obscureText: false,
                                    isLargeScreen: false,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    controller: loginCtrl.email,
                                    onFieldSubmitted: (value) {
                                      LoginWidget().fieldFocusChange(
                                          context,
                                          loginCtrl.userFocus,
                                          loginCtrl.passwordFocus);
                                    },
                                    focusNode: loginCtrl.userFocus,
                                    validator: (value) => LoginValidation()
                                        .checkIDValidation(value),
                                    text: LoginFont().emailHint,
                                    suffixIcon: Image.asset(iconAssets.atsign),
                                    borderColor: appCtrl.appTheme.primary
                                        .withOpacity(.3),
                                    hintColor:
                                    appCtrl.appTheme.darkContentColor,
                                    fillcolor: appCtrl.appTheme.lightGray,
                                  ),

                                  Space(0,11),
                                  // password layout
                                  LoginWidget().textFieldLayout(
                                    isLargeScreen: false,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.none,
                                    controller: loginCtrl.password,
                                    focusNode: loginCtrl.passwordFocus,
                                    obscureText: loginCtrl.passwordVisible,
                                    validator: (value) => LoginValidation()
                                        .checkPasswordValidation(value),
                                    suffixIcon: InkWell(
                                      onTap: (){
                                        loginCtrl.toggle();
                                      },
                                      child: Image.asset(loginCtrl.passwordVisible ? iconAssets.hide : iconAssets.view,
                                          color: appCtrl.appTheme.titleColor, ),
                                    ),
                                    text: LoginFont().password,
                                    borderColor: appCtrl.appTheme.primary
                                        .withOpacity(.3),
                                    hintColor:  appCtrl.appTheme.darkContentColor,
                                    fillcolor: appCtrl.appTheme.lightGray,
                                  ),
                                  Space(0, 5),
                                  //forgot password text layout
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: LoginWidget().forgotPasswordWidget(
                                        color:
                                            appCtrl.appTheme.darkContentColor),
                                  ),

                                  //signin button layout
                                  LoginWidget().signInButton(
                                      color: appCtrl.appTheme.primary,
                                      context: context,
                                      fontColor: appCtrl.appTheme.whiteColor,
                                      onTap: () {
                                        FocusScopeNode currentFocus = FocusScope.of(context);

                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                        if(loginCtrl.loginformKey.currentState!.validate()) {
                                          Get.offAndToNamed(routeName.home);
                                        }
                                      }),
                                  Space(0, 14),

                                  //create user layout
                                  LoginWidget().createUserWidget(
                                      fontWeight: FontWeight.w600,
                                      onTap: () {
                                        Get.toNamed(routeName.signup);
                                      },
                                      color: appCtrl.appTheme.darkContentColor),
                                  Space(0, 8),

                                  //signup with text layout
                                  LoginWidget().loginWithLayout(
                                      fontWeight: FontWeight.w700,
                                      color: appCtrl.appTheme.contentColor,
                                      fontColor: appCtrl.appTheme.primary),
                                  Space(0,8),
                                  IconButtonWidget(
                                    lefMargin: 0,
                                    rightMargin: 0,
                                    icon: iconAssets.mobileIcon,
                                    type: LoginFont().phone,
                                    textWidget: LoginFontStyle()
                                        .mulishtextLayout(
                                        text: LoginFont().continueWithPhone,
                                        color: appCtrl.appTheme.titleColor,
                                        fontSize: textSizeMedium,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Space(0, 10),

                                  // continoue with google layout
                                  IconButtonWidget(
                                    lefMargin: 0,
                                    rightMargin: 0,
                                    icon: iconAssets.google,
                                    textWidget: LoginFontStyle()
                                        .mulishtextLayout(
                                        text:
                                        LoginFont().continueWithGoogle,
                                        color: appCtrl.appTheme.titleColor,
                                        fontSize: textSizeMedium,
                                        fontWeight: FontWeight.bold),
                                    type: LoginFont().google,
                                  )
                                ]),
                          ),

                          // Space(0, 10),
                        ],
                      ),
                    )),
                // continue as guest text layout
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
