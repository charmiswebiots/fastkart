import '../../../../config.dart';

class TabBarViewLayout extends StatelessWidget {
  const TabBarViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (notificationCtrl) {
      return Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notificationCtrl.notificationList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: AppScreenUtil().screenWidth(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationStyle().titleLayout(
                      text: notificationCtrl.notificationList[index]['day']
                          .toString(),
                      color:
                          notificationCtrl.appCtrl.appTheme.darkContentColor),
                  ...notificationCtrl.notificationList[index]['child'].map((e) {
                    return NotificationCard(
                      data: e,
                      titleColor: notificationCtrl.appCtrl.appTheme.titleColor,
                      dateColor:
                          notificationCtrl.appCtrl.appTheme.darkContentColor,
                      primaryColor: notificationCtrl.appCtrl.appTheme.primary,
                    );
                  }).toList()
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
