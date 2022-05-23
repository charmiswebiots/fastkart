import 'package:fastkart/views/drawer/drawer_layout/rtl_switcher.dart';

import '../../../../config.dart';

class YourAccountCommonList extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onToggle;
  final ValueChanged<bool>? onToggleRtl;
  final int? indexKey;

  const YourAccountCommonList(
      {Key? key,
      this.onTap,
      this.data,
      this.onToggle,
      this.indexKey,
      this.onToggleRtl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourAccountController>(builder: (yourAccountCtrl) {
      return Directionality(
        textDirection: yourAccountCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: InkWell(
          onTap: onTap,
          child: Container(
              margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8.0)),
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(10),
                  horizontal: AppScreenUtil().screenWidth(10)),
              decoration: BoxDecoration(
                  color: yourAccountCtrl.appCtrl.appTheme.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      YourAccountStyle().commonImageLayout(
                          image: data['icon'],
                          height: 20,
                          iconColor: yourAccountCtrl.appCtrl.appTheme.titleColor),
                      const Space(20, 0),
                      YourAccountFontStyle().mulishtextLayout(
                          text: data['title'],
                          fontSize: 14,
                          color: yourAccountCtrl.appCtrl.appTheme.titleColor),
                    ],
                  ),
                  (data['title'] == "Theme" ||
                          data['title'] == "थीम" ||
                          data['title'] == "테마" ||
                          data['title'] == "سمة")
                      ? ThemeSwitcher(
                          onToggle: onToggle,
                          status2: yourAccountCtrl.appCtrl.isTheme,
                        )
                      : (data['title'] == "RTL" || data['title'] == "आरटीएल")
                          ? RtlSwitcher(
                              onToggle: onToggleRtl,
                              status2: yourAccountCtrl.appCtrl.isRTL,
                            )
                          : YourAccountStyle().forwardArrow(
                              color: indexKey ==
                                      yourAccountCtrl.appCtrl.drawerSelectedIndex
                                  ? yourAccountCtrl.appCtrl.appTheme.whiteColor
                                  : yourAccountCtrl
                                      .appCtrl.appTheme.arrowSelectColor,
                              context: context)
                ],
              )),
        ),
      );
    });
  }
}
