import 'package:fastkart/shimmer_effect/notification_shimmer/tab_shimmer.dart';
import 'package:fastkart/shimmer_effect/notification_shimmer/tabbar_view_shimmer.dart';

import '../../config.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<NotificationController>(builder: (notificationCtrl) {
        return Scaffold(
          body: Shimmer.fromColors(
              baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
              highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
              child: SingleChildScrollView(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabShimmer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1,
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: notificationCtrl.tabController,
                            children: const <Widget>[
                              TabBarViewShimmer(),
                              TabBarViewShimmer(),
                            ]),
                      )
                    ],
                  ),
                ),
              )),
        );
      });
    });
  }
}
