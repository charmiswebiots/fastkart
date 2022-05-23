import '../../../../config.dart';

class CommonPopUpButton extends StatelessWidget {
  final Color? containerColor;
  final Color? borderColor;
  final Color? textColor;
 final String? text;
  final GestureTapCallback? onTap;

  const CommonPopUpButton({Key? key,this.text,this.borderColor,this.containerColor,this.textColor,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,

        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenWidth(13),
           ),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(
              color: borderColor!, width: .5), //border of dropdown button
        ),
        child: OfferFontStyle().mulishtextLayout(
            text: text,
            textAlign: TextAlign.center,
            fontSize: OfferFontSize.textSizeSmall,
            color: textColor),
      ),
    );
  }
}
