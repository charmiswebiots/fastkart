import '../../../config.dart';

class IosBottomNavigationBar extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final int? selectedIndex;
  final ValueChanged<int>? onTap;

  IosBottomNavigationBar({Key? key, this.onTap, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Offstage(
        offstage: selectedIndex == 4 ? true : false,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: BottomNavigationFontSize().textSizeSmall,
          unselectedItemColor: appCtrl.appTheme.white.withOpacity(.8),
          backgroundColor: appCtrl.appTheme.primary,
          selectedItemColor: appCtrl.appTheme.white,
          selectedLabelStyle: TextStyle(
              fontSize: BottomNavigationFontSize().textSizeSmall,
              fontWeight:
                  selectedIndex == 0 ? FontWeight.w800 : FontWeight.normal),
          items: <BottomNavigationBarItem>[
            ...appCtrl.bottomNavigationList.asMap().entries.map((e) {
              return BottomNavigationWidget().bottomNavigationCard(
                  color: appCtrl.appTheme.primary,
                  text: e.value['title'],
                  imageIcon: e.value['icon'],
                  imagecolor: selectedIndex == e.key
                      ? appCtrl.appTheme.white
                      : appCtrl.appTheme.white.withOpacity(.8),
                  height: 20,
                  width: 20);
            }).toList(),
          ],
          currentIndex: selectedIndex!,
          onTap: onTap,
        ),
      );
    });
  }
}
