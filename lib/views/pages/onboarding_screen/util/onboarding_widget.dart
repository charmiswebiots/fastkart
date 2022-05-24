import '../../../../config.dart';

class OnboardingWidget {
  //background Image
  Widget backgroundImage(
      {String? image, double? height, BuildContext? context}) {
    return Container(
      height: MediaQuery.of(context!).size.height / height!,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image!,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  //small logo Image
  Widget smallLogoImage({String? image, BuildContext? context}) {
    return Image.asset(image!, width: MediaQuery.of(context!).size.width);
  }

  //title, description and image layout
  Widget layout(
      {context, image, var titleColor, var contentColor, bool? isTheme}) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3.1,
        child: Column(children: [
          //logo layout
          OnboardingWidget().smallLogoImage(
              image:
                  isTheme! ? imageAssets.themeLogo : imageAssets.smallLogoImage,
              context: context),
          const Space(0, 2),

          //get safe delivery text layout
          OnboardingFontStyle().nunitoAndQuicksandtextLayout(
              text: OnboardingFont().getSafeDelivery,
              color: titleColor,
              fontSize: OnboardingFontSize.textSizeNormal,
              fontWeight: FontWeight.w500,
              type: 'quicksand'),
          const Space(0, 5),

          //description layout
          OnboardingFontStyle().nunitoAndQuicksandtextLayout(
              text: OnboardingFont().description,
              color: contentColor,
              fontSize: OnboardingFontSize.textSizeSMedium,
              fontWeight: FontWeight.normal,
              type: 'nunito'),
        ]));
  }

  //social login layout
  Widget socialLoginLayout({context, Widget? child}) {
    return Container(
        height: MediaQuery.of(context).size.height / 4.50,
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: child);
  }
}
