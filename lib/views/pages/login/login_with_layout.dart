import 'package:dotted_line/dotted_line.dart';
import '../../../config.dart';

class LoginWithLayout extends StatelessWidget {

  const LoginWithLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            Expanded(
              child: DottedLine(
                direction: Axis.horizontal,
                dashLength: 5,
                dashColor: appCtrl.appTheme.contentColor,
                lineThickness: 2,
                dashRadius: 2,
              ),
            ),
            const Space(10, 0),
            LoginFontStyle().mulishtextLayout(
              color: appCtrl.appTheme.primary,
              text: LoginFont().signInWith,
              fontWeight: FontWeight.w700,
              fontSize: LoginFontSize.textSizeSMedium,
            ),
            const Space(10, 0),
            Expanded(
              child: DottedLine(
                direction: Axis.horizontal,
                dashLength: 5,
                dashColor: appCtrl.appTheme.contentColor,
                lineThickness: 2,
                dashRadius: 2,
              ),
            )
          ],
        );
      }
    );
  }
}
