import '../../../config.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
              AppScreenUtil().screenWidth(15)),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    imageAssets.usersquare,
                    height: AppScreenUtil().screenHeight(50),
                  ),
                  Space(10, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderTrackFontStyle().mulishtextLayout(
                          text: "Andrea Joanne",
                          fontSize: OrderTrackFontSize.textSizeSMedium,
                          color: appCtrl.appTheme.titleColor),
                      OrderTrackFontStyle().mulishtextLayout(
                          text: OrderTrackFont().courier,
                          fontSize: OrderTrackFontSize.textSizeSMedium,
                          color: appCtrl
                              .appTheme
                              .darkContentColor),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  OrderTrackStyle()
                      .commonLayoutForIcon(
                      image: iconAssets.call,
                      boxColor: appCtrl
                          .appTheme
                          .primary,
                      borderColor: appCtrl
                          .appTheme
                          .primary),
                  Space(15, 0),
                  OrderTrackStyle()
                      .commonLayoutForIcon(
                      image: iconAssets.chat,
                      boxColor: appCtrl
                          .appTheme
                          .whiteColor,
                      borderColor: appCtrl
                          .appTheme
                          .primary),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
