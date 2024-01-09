import 'package:fastkart/config.dart';

class SettingStyle {

  //user icon layout
  Widget userImageLayout({String? image, double? height, context, var color}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          image!,
          height: AppScreenUtil().screenHeight(90),
        ),
        SettingWidget().editIcon(context: context, primaryColor: color)
      ],
    );
  }

  //user email text layout
  Widget userEmailLayout(color) {
    return SettingFontStyle().mulishtextLayout(
        text: 'andreajoanne@gmail.com',
        fontSize: SettingFontSize.textSizeSmall,
        fontWeight: FontWeight.normal,
        color: color);
  }

  //profile and password icon
  Widget profileAndPasswordIconLayout(icon, color) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 10 : 15)),
        child: Image.asset(icon,
            fit: BoxFit.contain,
            color: color,
            height: AppScreenUtil().screenHeight(10),
            width: AppScreenUtil().screenWidth(10)));
  }

  //phone icon
  Widget phoneIconLayout(icon, color) {
    return Padding(
      padding: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(2),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 12 : 15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 12 : 15)),
      child: Image.asset(icon,
          color: color, height: AppScreenUtil().screenHeight(10)),
    );
  }

  //change password text
  Widget changePassWord({var color}) {
    return SettingFontStyle().mulishtextLayout(
        text: SettingFont().changePassword,
        fontWeight: FontWeight.w700,
        fontSize: SettingFontSize.textSizeSmall,
        color: color);
  }
}
