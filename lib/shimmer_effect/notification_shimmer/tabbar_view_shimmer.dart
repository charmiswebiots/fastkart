import 'package:fastkart/shimmer_effect/notification_shimmer/notification_list_shimmer.dart';

import '../../config.dart';

class TabBarViewShimmer extends StatelessWidget {
  const TabBarViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<NotificationController>(builder: (notificationCtrl) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notificationCtrl.notificationList.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(15),
                bottom: AppScreenUtil().screenHeight(10),
                top: AppScreenUtil().screenHeight(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray.withOpacity(.4),
                    borderColor: appCtrl.appTheme.lightGray.withOpacity(.4),
                    borderRadius: 2,
                    height: 10,
                    width: 80),
                const Space(0, 20),
                ...notificationCtrl.notificationList[index]['child'].map((e) {
                  return const NotificationListShimmer();
                }).toList(),
              ],
            ),
          ),
        );
      });
    });
  }
}
