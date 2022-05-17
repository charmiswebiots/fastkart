import '../../../../config.dart';

class BackgroundLayout extends StatelessWidget {
  final String? icon;
  const BackgroundLayout({Key? key,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Stack(
          children: [
            Image.asset(
              imageAssets.map,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: AppScreenUtil().screenHeight(12),
                  left: AppScreenUtil().screenWidth(15),
                  right: AppScreenUtil().screenWidth(15)),
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenWidth(12)),
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.whiteColor,
                  borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
              child: Row(
                children: [
                  Image.asset(
                    icon!,
                    height: AppScreenUtil().screenHeight(15),
                    color: appCtrl.appTheme.titleColor,
                  ),
                  const Space(10, 0),
                  AddAddressFontStyle().mulishtextLayout(
                      text: AddAddressFont().delivery +' on 7th Aug, ${AddAddressFont().delivery} 7am to 9am',
                      fontSize: AddAddressFontSize.textSizeSMedium,
                      color: appCtrl.appTheme.titleColor)
                ],
              ),
            ),
            Positioned(
              right: 15,
              top: MediaQuery.of(context).size.width / 1.4,
              child: FloatingActionButton(
                  elevation: 0.0,
                  child: Image.asset(
                    iconAssets.crosshair,
                    height: AppScreenUtil().screenHeight(25),
                  ),
                  backgroundColor: appCtrl.appTheme.whiteColor,
                  onPressed: () {}),
            ),
          ],
        );
      }
    );
  }
}
