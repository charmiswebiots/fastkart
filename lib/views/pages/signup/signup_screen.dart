import 'package:fastkart/controllers/signup_controller.dart';
import 'package:fastkart/views/pages/signup/util/signup_constants.dart';
import 'package:fastkart/views/pages/signup/util/signup_fontstyle.dart';
import 'package:fastkart/views/pages/signup/util/signup_validation.dart';
import 'package:fastkart/views/pages/signup/util/signup_widget.dart';
import 'package:fastkart/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var signupCtrl = Get.put(SignupController());
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => Scaffold(
        backgroundColor: appCtrl.appTheme.primary,
        body: Container(
            height: AppScreenUtil().screenActualHeight(),
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: Stack(
                  children: [
                    //background Image layout
                    SignupWidget().signupBackGroundImage(
                        imageAssets.backgroundImage, context),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        //white body container layout
                        SignupWidget().bodyContainer(
                            color: appCtrl.appTheme.whiteColor,
                            context: context,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //logo image layout
                                              appCtrl.isTheme ? Image.asset( imageAssets.themeLogo,fit: BoxFit.contain,height: AppScreenUtil().screenHeight(20),) :  Image.asset(
                                                  imageAssets.smallLogoImage),
                                              Space(0, 18),

                                              //description text layout
                                              SignupFontStyle()
                                                  .nunitotextLayout(
                                                      text: SignupFont()
                                                          .description,
                                                      color:
                                                          appCtrl.appTheme
                                                              .darkContentColor,
                                                      fontSize:
                                                          textSizeSMedium),
                                              Space(0, 20),

                                              //register account text layout
                                              SignupFontStyle()
                                                  .mulishtextLayout(
                                                      text: SignupFont()
                                                          .registerAccount,
                                                      color: appCtrl
                                                          .appTheme.titleColor,
                                                      fontSize: textSizeMedium,
                                                      fontWeight:
                                                          FontWeight.w700),
                                              Space(0, 16),

                                              //fullname textformfiel layout
                                              SignupWidget().textFieldLayout(
                                                controller: signupCtrl.username,
                                                keyboardType:
                                                    TextInputType.name,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onFieldSubmitted: (value) {
                                                  SignupWidget()
                                                      .fieldFocusChange(
                                                          context,
                                                          signupCtrl
                                                              .usernameFocus,
                                                          signupCtrl
                                                              .emailFocus);
                                                },
                                                focusNode:
                                                    signupCtrl.usernameFocus,
                                                validator: (value) =>
                                                    SignupValidation()
                                                        .checkUserNameValidation(
                                                            value),
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: AppScreenUtil()
                                                          .screenHeight(10)),
                                                  child: Image.asset(
                                                    iconAssets.profile,
                                                    fit: BoxFit.contain,
                                                    color: appCtrl
                                                        .appTheme.titleColor,
                                                    height: AppScreenUtil()
                                                        .screenHeight(10),
                                                    width: AppScreenUtil()
                                                        .screenWidth(10),
                                                  ),
                                                ),
                                                text: SignupFont().fullName,
                                                borderColor: appCtrl
                                                    .appTheme.primary
                                                    .withOpacity(.3),
                                                hintColor: appCtrl
                                                    .appTheme.contentColor,
                                                fillcolor: appCtrl
                                                    .appTheme.textBoxColor,
                                              ),
                                              Space(0, 13),

                                              //email textformfiel layout
                                              SignupWidget().textFieldLayout(
                                                controller: signupCtrl.email,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onFieldSubmitted: (value) {
                                                  SignupWidget()
                                                      .fieldFocusChange(
                                                          context,
                                                          signupCtrl.emailFocus,
                                                          signupCtrl
                                                              .passwordFocus);
                                                },
                                                focusNode:
                                                    signupCtrl.emailFocus,
                                                validator: (value) =>
                                                    SignupValidation()
                                                        .checkIDValidation(
                                                            value),
                                                text: SignupFont().emailHint,
                                                suffixIcon: Image.asset(
                                                    iconAssets.atsign,
                                                    color: appCtrl
                                                        .appTheme.titleColor),
                                                borderColor: appCtrl
                                                    .appTheme.primary
                                                    .withOpacity(.3),
                                                hintColor: appCtrl
                                                    .appTheme.contentColor,
                                                fillcolor: appCtrl
                                                    .appTheme.textBoxColor,
                                              ),
                                              Space(0, 13),
                                            ],
                                          ),

                                          //email password layout
                                          SignupWidget().textFieldLayout(
                                            controller: signupCtrl.password,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.none,
                                            obscureText:
                                                signupCtrl.passwordVisible,
                                            focusNode: signupCtrl.passwordFocus,
                                            validator: (value) =>
                                                SignupValidation()
                                                    .checkPasswordValidation(
                                                        value),
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  signupCtrl.toggle();
                                                },
                                                child: Image.asset(
                                                    signupCtrl.passwordVisible
                                                        ? iconAssets.hide
                                                        : iconAssets.view,
                                                    color: appCtrl
                                                        .appTheme.titleColor)),
                                            text: SignupFont().password,
                                            borderColor: appCtrl
                                                .appTheme.primary
                                                .withOpacity(.3),
                                            hintColor: appCtrl
                                                .appTheme.contentColor,
                                            fillcolor: appCtrl
                                                .appTheme.textBoxColor,
                                          ),
                                          Space(0, 20),

                                          //signup button layout
                                          SignupWidget().signUpButton(
                                              color: appCtrl.appTheme.primary,
                                              context: context,
                                              fontColor:
                                                  appCtrl.appTheme.whiteColor,
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  print('Valid');
                                                }
                                              }),
                                          Space(0, 25),

                                          //already account widget
                                          SignupWidget().alreadyAccountWidget(
                                              onTap: () {
                                                Get.back();
                                              },
                                              color: appCtrl
                                                  .appTheme.darkContentColor),
                                          Space(0, 25),

                                          //signup with text layout
                                          SignupWidget().loginWithLayout(
                                              color:
                                                  appCtrl.appTheme.contentColor,
                                              fontColor:
                                                  appCtrl.appTheme.primary),
                                          Space(0, 35),

                                          //continoue with phone layout
                                          IconButtonWidget(
                                            lefMargin: 0,
                                            rightMargin: 0,
                                            icon: iconAssets.mobileIcon,
                                            textWidget: SignupFontStyle()
                                                .mulishtextLayout(
                                                    text: SignupFont()
                                                        .continueWithPhone,
                                                    color: appCtrl
                                                        .appTheme.titleColor,
                                                    fontSize: textSizeMedium,
                                                    fontWeight:
                                                        FontWeight.bold),
                                            type: SignupFont().phone,
                                          ),
                                          Space(0, 15),

                                          //continoue with google layout
                                          IconButtonWidget(
                                            lefMargin: 0,
                                            rightMargin: 0,
                                            icon: iconAssets.google,
                                            textWidget: SignupFontStyle()
                                                .mulishtextLayout(
                                                    text: SignupFont()
                                                        .continueWithGoogle,
                                                    color: appCtrl
                                                        .appTheme.titleColor,
                                                    fontSize: textSizeMedium,
                                                    fontWeight:
                                                        FontWeight.bold),
                                            type: SignupFont().google,
                                          ),
                                        ],
                                      ),
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
                ))),
      ),
    );
  }
}
