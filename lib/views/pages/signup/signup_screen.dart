import 'package:fastkart/views/pages/signup/signup_layout/signup_main_layout.dart';

import '../../../config.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final signupCtrl = Get.put(SignupController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return Directionality(
        textDirection: ctrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: AppComponent(
          child: GetBuilder<SignupController>(
            builder: (controller) => Scaffold(
              backgroundColor: signupCtrl.appCtrl.appTheme.primary,
              body: SizedBox(
                  height: AppScreenUtil().screenActualHeight(),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
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
                              SignupMainLayout(
                                formKey: formKey,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    signupCtrl.signInClick(context: context);
                                  }
                                },
                              ),
                              //continue as guest text layout
                              SignupWidget().continueAsGuest(
                                  color: signupCtrl.appCtrl.appTheme.titleColor)
                            ],
                          )
                        ],
                      ))),
            ),
          ),
        ),
      );
    });
  }
}
