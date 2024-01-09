import '../../../../config.dart';

class CreateNewUser extends StatelessWidget {
  final GestureTapCallback? onTap;
  const CreateNewUser({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginFontStyle().mulishtextLayout(
                color: appCtrl.appTheme.darkContentColor,
                text: LoginFont().creatUser,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                onTap: onTap),
            const Space(1.5, 0),
            LoginFontStyle().mulishtextLayout(
                color: appCtrl.appTheme.darkContentColor,
                text: LoginFont().createNow,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                textDecoration: TextDecoration.underline,
                onTap: onTap),
          ],
        );
      }
    );
  }
}
