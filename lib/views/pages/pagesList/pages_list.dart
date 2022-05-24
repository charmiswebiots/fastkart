import '../../../config.dart';

class PagesList extends StatelessWidget {
  final pageCtrl = Get.put(PagesListController());

  PagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<PagesListController>(builder: (_) {
        return Directionality(
          textDirection:
              pageCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: pageCtrl.appCtrl.appTheme.whiteColor,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: pageCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: CommonAppBarLeading(
                onTap: () => Get.back(),
                isImage: false,
              ),
              title: PageListWidget().appBarTitleLayout(
                  text: PageListFont().pagesList,
                  textColor: pageCtrl.appCtrl.appTheme.titleColor),
              actions: [
                AppBarHomeIconLayout(
                    icon: iconAssets.drawerHome,
                    onTap: () => pageCtrl.goToHome()),
              ],
            ),
            bottomNavigationBar: BottomNavigatorCard(
              selectedIndex: pageCtrl.appCtrl.selectedIndex,
              onTap: (val) async {
                Get.back();
                if (pageCtrl.appCtrl.selectedIndex == 4) {
                  Get.toNamed(routeName.myCart, arguments: false);
                } else {
                  await pageCtrl.appCtrl.getStorage
                      .write('selectedIndex', pageCtrl.appCtrl.selectedIndex);
                  pageCtrl.appCtrl.selectedIndex = val;
                  pageCtrl.appCtrl.update();
                }
              },
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //description layout
                  PageListWidget().descriptionLayout(
                      context: context,
                      boxColor: pageCtrl.appCtrl.appTheme.wishtListBoxColor,
                      titleColor: pageCtrl.appCtrl.appTheme.titleColor),
                  //page list Layout

                  const PagesListCardLayout()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
