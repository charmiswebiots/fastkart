import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/login/login_layout/login_main_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: loginCtrl.appCtrl.appTheme.primary,
          body: Directionality(
            textDirection: ctrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: AppComponent(
              child: GetBuilder<LoginController>(
                builder: (_) => SizedBox(
                  height: AppScreenUtil().screenActualHeight(),
                  child: Stack(
                    children: [
                      //background Image layout
                      LoginWidget().loginBackGroundImage(
                          imageAssets.backgroundImage, context),
                      //main body container
                      const LoginMainLayout()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
