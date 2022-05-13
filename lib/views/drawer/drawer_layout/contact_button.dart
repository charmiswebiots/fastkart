import '../../../config.dart';

class ContactButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final String? text;

  const ContactButton({Key? key,this.onTap,this.text,this.textColor,this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: AppScreenUtil().screenWidth(150),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: DrawerFontStyle().mulishtextLayout(
            color: textColor,
            text: text,
            fontSize: 10,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
