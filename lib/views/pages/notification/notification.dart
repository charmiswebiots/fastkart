import '../../../config.dart';

class Notification extends StatelessWidget {
  final notificationCtrl = Get.put(NotificationController());

  Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<NotificationController>(builder: (_) {
          return Scaffold(
            appBar: NotificationWidget().appBarLayout(
                bgColor: notificationCtrl.appCtrl.appTheme.whiteColor,
                titleColor: notificationCtrl.appCtrl.appTheme.titleColor,
                text: NotificationFont().notification,
                onTap: () => notificationCtrl.goToHome()),
            backgroundColor: notificationCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Container(
                  color: notificationCtrl.appCtrl.appTheme.whiteColor,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        //days and mark read all layout
                        const NotificationCategoryLayout(),

                        SizedBox(
                          height: AppScreenUtil().screenHeight(750),
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: notificationCtrl.tabController,
                              children: const <Widget>[
                                TabBarViewLayout(),
                                TabBarViewLayout(),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
