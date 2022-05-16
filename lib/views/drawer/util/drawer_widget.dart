import '../../../config.dart';

class DrawerWidget {
  //user image layout
  Widget userImageLayout(
      {double? borderRaius, var image, double? imageHeight}) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(AppScreenUtil().borderRadius(borderRaius!)),
      child: Image.asset(
        image,
        height: AppScreenUtil().screenHeight(imageHeight!),
        fit: BoxFit.fill,
      ),
    );
  }


  //pop layout
  Widget popLayout(
      {Widget? child,
        var
        context}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
        child: child);
  }

  //username and email layout
  Widget userNameAndEmailLayout(
      {String? userName,
      String? userEmail,
      var userNameFontColor,
      var emailFontColor,
      double? nameFontSize,
      double? emailFontSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerFontStyle().mulishtextLayout(
          text: userName,
          fontSize: nameFontSize!,
          fontWeight: FontWeight.w700,
          color: userNameFontColor,
        ),
        DrawerFontStyle().mulishtextLayout(
          text: userEmail,
          fontSize: emailFontSize!,
          color: emailFontColor,
        ),
      ],
    );
  }


  //common Image Layout
  Widget commonImageLayout({String? image, double? height, var iconColor}) {
    return image == 'assets/icons/language.png'
        ? Image.asset(image!, height: AppScreenUtil().screenHeight(height!))
        : Image.asset(
            image!,
            height: AppScreenUtil().screenHeight(height!),
            color: iconColor,
          );
  }


}
