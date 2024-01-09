import 'package:fastkart/utilities/responsive_layout.dart';
import '../../../config.dart';

class AndroidBottomNavigationBar extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final int? selectedIndex;
  final ValueChanged<int>? onTap;

  AndroidBottomNavigationBar({
    Key? key,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Offstage(
        offstage: selectedIndex == 4 ? true : false,
        child: SizedBox(
          height: AppScreenUtil()
              .screenHeight(ResponsiveWidget.isSmallScreen(context)
                  ? appCtrl.languageVal == "ar" || appCtrl.isRTL
                      ? 70
                      : 68
                  : appCtrl.languageVal == "ar" || appCtrl.isRTL
                      ? 57
                      : 55),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: BottomNavigationFontSize().textSizeSmall,
            unselectedItemColor: appCtrl.appTheme.white.withOpacity(.8),
            backgroundColor: appCtrl.appTheme.primary,
            selectedItemColor: appCtrl.appTheme.white,
            selectedLabelStyle: TextStyle(
                fontSize: BottomNavigationFontSize().textSizeSmall,
                fontWeight: FontWeight.bold),
            items: [
              ...appCtrl.bottomNavigationList.asMap().entries.map((e) {
                return  BottomNavigationWidget().bottomNavigationCard(
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
        ),
      );
    });
  }
}
