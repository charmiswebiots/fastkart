import 'package:fastkart/views/pages/signup/signup_layout/dotted_line.dart';

import '../../../../config.dart';

class LoginWithLayout extends StatelessWidget {
  const LoginWithLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            DottedLineLayout(color: appCtrl.appTheme.contentColor,),
            const  Space(10, 0),
            SignupFontStyle().mulishtextLayout(
              color: appCtrl.appTheme.primary,
              text: SignupFont().signInWith,
              fontWeight: FontWeight.w700,
              fontSize: SignupFontSize.textSizeSMedium,
            ),
            const Space(10, 0),
            DottedLineLayout(color: appCtrl.appTheme.contentColor,),
          ],
        );
      }
    );
  }
}
