import '../../../config.dart';

class ErrorDataLayout extends StatelessWidget {
  const ErrorDataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          children: [
            Error404Widget().commonIconImage(
                image: imageAssets.noPageFoundImage, height: 100),
            const Space(0, 15),
            Error404FontStyle().quicksandtextLayout(
                text: Error404Font().pageNotFound,
                fontSize: Error404FontSize.textSizeNormal,
                color: appCtrl.appTheme.titleColor,
                fontWeight: FontWeight.w600),
            const Space(0, 15),
            Error404FontStyle().quicksandtextLayout(
                text: Error404Font().description,
                fontSize: Error404FontSize.textSizeSMedium,
                color: appCtrl.appTheme.darkContentColor,
                fontWeight: FontWeight.normal),
            const Space(0, 15),
            Error404Widget().backToHomeWidget(
                text: Error404Font().backToHome,
                color: appCtrl.appTheme.primary,
                fontColor: appCtrl.appTheme.whiteColor,
                context: context)
          ],
        );
      }
    );
  }
}
