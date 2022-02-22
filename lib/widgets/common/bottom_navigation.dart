import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:flutter/material.dart';

class BottomNavigatorCard extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int? selectedIndex;
  ValueChanged<int>? onTap;
  String? alertCount;

  BottomNavigatorCard(
      {Key? key, this.selectedIndex, this.onTap, this.alertCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('alert : $alertCount');
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedItemColor: appCtrl.appTheme.whiteColor,
      backgroundColor: appCtrl.appTheme.primary,
      selectedItemColor: appCtrl.appTheme.whiteColor,
      selectedLabelStyle: TextStyle(fontSize: 12),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: appCtrl.appTheme.primary,
          icon: Image.asset(
            iconAssets.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: appCtrl.appTheme.primary,
          icon: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                iconAssets.white_category_icon,

              ),
            ],
          ),
          label: 'Category',
        ),

      ],
      currentIndex: selectedIndex!,
      onTap: onTap,
    );
  }
}
