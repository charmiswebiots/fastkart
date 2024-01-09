import 'package:fastkart/config.dart';
import 'package:fastkart/views/drawer/drawer_layout/rtl_switcher.dart';

class CommonDrawerList extends StatelessWidget {
  final int? index;
  final String? image;
  final String? title;
  final double? height;
  final ValueChanged<bool>? onToggle;
  final ValueChanged<bool>? onToggleRtl;
  final double? fontSize;

  const CommonDrawerList(
      {Key? key,
      this.onToggle,
      this.index,
      this.image,
      this.title,
      this.height,
      this.fontSize,
      this.onToggleRtl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () => appCtrl.selectPage(index: index, context: context),
        child: DrawerStyle().drawerListLayout(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DrawerWidget().commonImageLayout(
                        image: image,
                        height: height,
                        iconColor: index == 10 || index == 11 || index == 12 || index == 5 || index == 6
                            ? appCtrl.appTheme.titleColor
                            : index == appCtrl.drawerSelectedIndex
                                ? appCtrl.appTheme.drawerSelectColor
                                : appCtrl.appTheme.titleColor),
                    const Space(20, 0),
                    DrawerFontStyle().mulishtextLayout(
                        text: title,
                        fontSize: fontSize!,
                        color: index == 10 || index == 11 || index == 12 || index == 5 || index == 6
                            ? appCtrl.appTheme.titleColor
                            : index == appCtrl.drawerSelectedIndex
                                ? appCtrl.appTheme.drawerSelectColor
                                : appCtrl.appTheme.titleColor),
                  ],
                ),
                (title == "Theme" ||
                        title == "थीम" ||
                        title == "테마" ||
                        title == "سمة")
                    ? ThemeSwitcher(
                        index: index,
                        onToggle: onToggle,
                        status2: appCtrl.isTheme,
                      )
                    : (title == "RTL" || title == "आरटीएल")
                        ? RtlSwitcher(
                            index: index,
                            onToggle: onToggleRtl,
                            status2: appCtrl.isRTL,
                          )
                        : DrawerStyle().forwardArrow(
                            color: index == appCtrl.drawerSelectedIndex
                                ? appCtrl.appTheme.whiteColor
                                : appCtrl.appTheme.arrowSelectColor,
                            context: context)
              ],
            ),
            color:index == 10 || index == 11 || index == 12 || index == 5 || index == 6
                ? appCtrl.appTheme.whiteColor
                : index == appCtrl.drawerSelectedIndex
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.whiteColor),
      );
    });
  }
}
