import 'package:fastkart/config.dart';

//Widget Layout
class AddressListWidget {
  //appbar leading layout
  Widget appBarLeadingLayput({
    GestureTapCallback? onTap,
  }) {
    return Row(
      children: [
        CommonAppBarLeading(
          onTap: onTap,
          isImage: false,
        ),
      ],
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(13),
          top: AppScreenUtil().screenHeight(13),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.blacktextboxSearchIcon,
        color: iconColor,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
      ),
    );
  }

  //proceedPayment button layout
  Widget proceedPaymentButtonLayout({context, var buttonColor, var itemColor}) {
    return Container(
      height: AppScreenUtil().screenHeight(50),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: AddressListFontStyle().mulishtextLayout(
          text: AddressListFont().proceedToPayment,
          color: itemColor,
          fontSize: AddressListFontSize.textSizeMedium),
    );
  }
}
