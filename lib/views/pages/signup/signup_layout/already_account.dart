import '../../../../config.dart';

class AlreadyAccount extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Color? color;
  const AlreadyAccount({Key? key,this.onTap,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignupFontStyle().mulishtextLayout(
            color: color,
            text: SignupFont().alreadyAccount,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            onTap: onTap),
        SignupFontStyle().mulishtextLayout(
            color: color,
            text: SignupFont().signIn,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            textDecoration: TextDecoration.underline,
            onTap: onTap),
      ],
    );
  }
}
