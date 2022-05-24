import 'dart:io';
import 'package:fastkart/config.dart';

//Widget Layout
class LoginWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //login background image layout
  Widget loginBackGroundImage(String image, context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }

  //fogot password widget
  Widget forgotPasswordWidget({color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LoginFontStyle().mulishtextLayout(
            text: LoginFont().forgotPassword,
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        const Space(0, 15),
      ],
    );
  }

//contiune as guest
  Widget continueAsGuest({color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 10.0 : 0),
      child: LoginFontStyle()
          .mulishtextLayout(
              text: LoginFont().continueAsGuest,
              color: color,
              fontSize: LoginFontSize.textSizeSMedium,
              textDecoration: TextDecoration.underline)
          .marginOnly(bottom: 10),
    );
  }
}
