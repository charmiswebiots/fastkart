import 'package:fastkart/config.dart';

class CommonDrawerList extends StatelessWidget {
  final int? index;
  final String? image;
  final String? title;
  final double? height;
  final ValueChanged<bool>? onToggle;
  final double? fontSize;

  const CommonDrawerList(
      {Key? key,
      this.onToggle,
      this.index,
      this.image,
      this.title,
      this.height,
      this.fontSize})
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
                        iconColor: index == 9
                            ? appCtrl.appTheme.titleColor
                            : index == appCtrl.drawerSelectedIndex
                                ? appCtrl.appTheme.drawerSelectColor
                                : appCtrl.appTheme.titleColor),
                    const Space(20, 0),
                    DrawerFontStyle().mulishtextLayout(
                        text: title,
                        fontSize: fontSize!,
                        color: index == 9
                            ? appCtrl.appTheme.titleColor
                            : index == appCtrl.drawerSelectedIndex
                                ? appCtrl.appTheme.drawerSelectColor
                                : appCtrl.appTheme.titleColor),
                  ],
                ),
                (title == "Theme")
                    ? ThemeSwitcher(
                        index: index,
                        onToggle: onToggle,
                        status2: appCtrl.isTheme,
                      )
                    : DrawerStyle().forwardArrow(
                        color: index == appCtrl.drawerSelectedIndex
                            ? appCtrl.appTheme.whiteColor
                            : appCtrl.appTheme.arrowSelectColor,
                        context: context)
              ],
            ),
            color: index == 9
                ? appCtrl.appTheme.whiteColor
                : index == appCtrl.drawerSelectedIndex
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.whiteColor),
      );
    });
  }
}
