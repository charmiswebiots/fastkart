import '../../../../config.dart';

class CommonPopUpButton extends StatelessWidget {
  var containerColor;
  var borderColor;
  var textColor;
  String? text;
  GestureTapCallback? onTap;

  CommonPopUpButton({Key? key,this.text,this.borderColor,this.containerColor,this.textColor,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenWidth(13),
            horizontal: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(
              color: borderColor, width: .5), //border of dropdown button
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
