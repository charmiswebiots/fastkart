import 'package:flutter_switch/flutter_switch.dart';
import '../../../config.dart';

class ThemeSwitcher extends StatelessWidget {

  final bool? status2;
  final ValueChanged<bool>? onToggle;
  final int? index;

 const ThemeSwitcher(
      {Key? key,
      this.onToggle,
      this.status2,this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return FlutterSwitch(
          width: AppScreenUtil().screenWidth(70),
          height: AppScreenUtil().screenHeight(25),
          toggleSize: 24.0,
          value: status2!,
          borderRadius: 30.0,
          padding: 1.0,
          activeColor: Colors.black,
          inactiveColor: appCtrl.appTheme.white,
          switchBorder: Border.all(
            color: appCtrl.appTheme.greyBGColor,
            width: 2.0,
          ),
          onToggle: onToggle!,
          activeIcon: Icon(
            Icons.nightlight_round,
            color: appCtrl.appTheme.green,
            size: AppScreenUtil().size(30),
          ),
          inactiveIcon: Icon(
            Icons.circle,
            color: appCtrl.appTheme.gray,
            size: AppScreenUtil().size(30),
          ),
        );
      }
    );
  }
}
