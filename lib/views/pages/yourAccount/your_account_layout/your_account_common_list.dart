
import 'package:fastkart/views/pages/dashboard/theme_switcher.dart';

import '../../../../config.dart';

class YourAccountCommonList extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onToggle;
  final int? indexKey;
  const YourAccountCommonList({Key? key,this.onTap,this.data,this.onToggle,this.indexKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourAccountController>(
      builder: (yourAccountCtrl) {
        return InkWell(
          onTap: onTap,
          child: Container(
              margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8.0)),
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(10),
                  horizontal: AppScreenUtil().screenWidth(10)),
              decoration: BoxDecoration(
                  color: yourAccountCtrl
                      .appCtrl.appTheme.whiteColor,
                  borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      YourAccountStyle().commonImageLayout(
                          image: data['icon'], height: 20, iconColor: yourAccountCtrl
                          .appCtrl.appTheme.titleColor),
                      const  Space(20, 0),
                      YourAccountFontStyle().mulishtextLayout(
                          text: data['title'], fontSize: 14, color: yourAccountCtrl
                          .appCtrl.appTheme.titleColor),
                    ],
                  ),
                  (data['title'] == "Theme")
                      ? ThemeSwitcher(
                    inActiveIconColor: yourAccountCtrl.appCtrl.appTheme.gray,
                    inactiveColor: yourAccountCtrl.appCtrl.appTheme.white,
                    activeColor: yourAccountCtrl
                        .appCtrl.appTheme.titleColor,
                    activeIconColor: yourAccountCtrl.appCtrl.appTheme.green,
                    onToggle: onToggle,
                    toggleColor: yourAccountCtrl
                        .appCtrl.appTheme.greyBGColor,
                    status2: yourAccountCtrl.appCtrl.isTheme,
                    iconColor: yourAccountCtrl
                        .appCtrl.appTheme.titleColor,
                  )
                      :YourAccountStyle(). forwardArrow(color: indexKey ==
                      yourAccountCtrl
                          .appCtrl.drawerSelectedIndex
                      ? yourAccountCtrl
                      .appCtrl.appTheme.whiteColor
                      : yourAccountCtrl
                      .appCtrl.appTheme.arrowSelectColor, context: context)
                ],
              )),
        );
      }
    );
  }
}
