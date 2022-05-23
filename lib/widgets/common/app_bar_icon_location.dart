import '../../config.dart';

class AppbarUserIconLocation extends StatelessWidget {
  const AppbarUserIconLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),

              right: AppScreenUtil().screenWidth(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Error404Widget().commonIconImage(
                  image: iconAssets.location, height: 16, color: appCtrl.appTheme.titleColor),
              const  Space(5, 0),
              Error404FontStyle().mulishtextLayout(
                  text: Error404Font().losAngeles,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              const Space(5, 0),
              Error404Widget().commonIconImage(image: iconAssets.user, height: 30),
            ],
          ),
        );
      }
    );
  }
}
