import '../../../config.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeController>(builder: (_) {
        return PopScope(
          canPop:false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: homeCtrl.appCtrl.isShimmer
                  ? const HomeShimmer()
                  : const SingleChildScrollView(
                      child: HomeDataLayout(),
                    ),
            ),
          ),
        );
      });
    });
  }
}
