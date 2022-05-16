
import '../../../../config.dart';

class NotificationCategoryLayout extends StatelessWidget {
  const NotificationCategoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: notificationCtrl.appCtrl.appTheme.textBoxColor,
          margin: EdgeInsets.only(
            bottom: AppScreenUtil().screenHeight(15),
          ),
          padding: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(8),
            left: AppScreenUtil().screenWidth(15),
            right: AppScreenUtil().screenWidth(15),
          ),
          height: AppScreenUtil().screenHeight(38),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NotificationWidget().tabBarLayout(
                    controller:
                    notificationCtrl.tabController,
                    titleColor: notificationCtrl
                        .appCtrl.appTheme.titleColor,
                    primary: notificationCtrl
                        .appCtrl.appTheme.primary,
                    tab1: NotificationFont().alert,
                    tab2: NotificationFont().offers),
              ),
              Row(
                children: [
                  Image.asset(
                    iconAssets.check,
                    height:
                    AppScreenUtil().screenHeight(20),
                  ),
                  NotificationFontStyle().mulishtextLayout(
                      text: NotificationFont().markRead,
                      color: notificationCtrl
                          .appCtrl.appTheme.primary,
                      fontSize: NotificationFontSize
                          .textSizeSMedium)
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
