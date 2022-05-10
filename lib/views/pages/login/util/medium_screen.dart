import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/login_controller.dart';
import 'package:fastkart/utilities/responsive_layout.dart';
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

    return GetBuilder<AppController>(
      builder: (ctrl) {
        return AppComponent(
          child: GetBuilder<LoginController>(
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
                          color: loginCtrl.appCtrl.appTheme.whiteColor,
                          context: context,
                          child: Form(
                            key: loginCtrl.loginformKey,
                            child: Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height /
                                      AppScreenUtil().screenHeight((ResponsiveWidget.isMediumScreen(context))  ? 1.28: 1.55),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //logo image layout
                                        loginCtrl.appCtrl.isTheme ? Image.asset( imageAssets.themeLogo,fit: BoxFit.contain,height: AppScreenUtil().screenHeight(20),) : Image.asset(imageAssets.smallLogoImage),
                                        Space(0, 10),

                                        //description text layout
                                        LoginFontStyle().nunitotextLayout(
                                            text: LoginFont().description,
                                            color: loginCtrl.appCtrl.appTheme.darkContentColor,
                                            fontSize: textSizeSmall),
                                        Space(0, 8),

                                        //login account text layout
                                        LoginFontStyle().mulishtextLayout(
                                            text: LoginFont().loginAccount,
                                            color: loginCtrl.appCtrl.appTheme.titleColor,
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
                                          borderColor: loginCtrl.appCtrl.appTheme.primary.withOpacity(.3),
                                          hintColor: loginCtrl.appCtrl.appTheme.contentColor,
                                          fillcolor: loginCtrl.appCtrl.appTheme.textBoxColor,
                                          suffixIcon: Image.asset(iconAssets.atsign,color: loginCtrl.appCtrl.appTheme.titleColor,),


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
                                                color: loginCtrl.appCtrl.appTheme.titleColor, ),
                                          ),
                                          text: LoginFont().password,
                                          borderColor: loginCtrl.appCtrl.appTheme.primary.withOpacity(.3),
                                          hintColor: loginCtrl.appCtrl.appTheme.contentColor,
                                          fillcolor: loginCtrl.appCtrl.appTheme.textBoxColor,
                                        ),
                                        Space(0, 5),
                                        //forgot password text layout
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: LoginWidget().forgotPasswordWidget(
                                              color:
                                                  loginCtrl.appCtrl.appTheme.darkContentColor),
                                        ),

                                        //signin button layout
                                        LoginWidget().signInButton(
                                            color: loginCtrl.appCtrl.appTheme.primary,
                                            context: context,
                                            fontColor: loginCtrl.appCtrl.appTheme.whiteColor,
                                            onTap: () {
                                              FocusScopeNode currentFocus = FocusScope.of(context);

                                              if (!currentFocus.hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                              if(loginCtrl.loginformKey.currentState!.validate()) {
                                                Get.offAndToNamed(routeName.dashboard);
                                              }
                                            }),
                                        Space(0, 14),

                                        //create user layout
                                        LoginWidget().createUserWidget(
                                            fontWeight: FontWeight.w600,
                                            onTap: () {
                                              Get.toNamed(routeName.signup);
                                            },
                                            color: loginCtrl.appCtrl.appTheme.darkContentColor),
                                        Space(0, 8),

                                        //signup with text layout
                                        LoginWidget().loginWithLayout(
                                            fontWeight: FontWeight.w700,
                                            color: loginCtrl.appCtrl.appTheme.contentColor,
                                            fontColor: loginCtrl.appCtrl.appTheme.primary),
                                        Space(0,8),
                                        IconButtonWidget(
                                          lefMargin: 0,
                                          rightMargin: 0,
                                          icon: iconAssets.mobileIcon,
                                          type: LoginFont().phone,
                                          textWidget: LoginFontStyle()
                                              .mulishtextLayout(
                                              text: LoginFont().continueWithPhone,
                                              color: loginCtrl.appCtrl.appTheme.titleColor,
                                              fontSize: textSizeMedium,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Space(0, 10),

                                        // continoue with google layout
                                        IconButtonWidget(
                                          onTap: () {
                                            if (LoginFont().google == 'phone') {
                                              Get.toNamed(routeName.login);
                                            }else{
                                              loginCtrl.googleLogin();
                                            }
                                          },
                                          lefMargin: 0,
                                          rightMargin: 0,
                                          icon: iconAssets.google,
                                          textWidget: LoginFontStyle()
                                              .mulishtextLayout(
                                              text:
                                              LoginFont().continueWithGoogle,
                                              color: loginCtrl.appCtrl.appTheme.titleColor,
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
                          .continueAsGuest(color: loginCtrl.appCtrl.appTheme.titleColor)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
