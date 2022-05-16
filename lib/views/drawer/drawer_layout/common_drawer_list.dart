import 'package:fastkart/config.dart';
import 'package:fastkart/views/drawer/util/drawer_style.dart';
import 'package:fastkart/views/pages/dashboard/theme_switcher.dart';

class CommonDrawerList extends StatelessWidget {
  final int? index;
  final String? image;
  final String? title;
 final double? height;
 final ValueChanged<bool>? onToggle;
 final double? fontSize;
  const CommonDrawerList({Key? key,this.onToggle, this.index,this.image,this.title,this.height,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () async {
          appCtrl.selectPage(index: index, context: context);
        },
        child: Container(
            margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8.0)),
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(10),
                horizontal: AppScreenUtil().screenWidth(10)),
            decoration: BoxDecoration(
                color: index == 9
                    ? appCtrl.appTheme.whiteColor
                    : index == appCtrl.drawerSelectedIndex
                        ? appCtrl.appTheme.primary
                        : appCtrl.appTheme.whiteColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DrawerWidget().commonImageLayout(
                        image: image, height: height, iconColor: index == 9
                        ? appCtrl.appTheme.titleColor
                        : index == appCtrl.drawerSelectedIndex
                        ? appCtrl.appTheme.drawerSelectColor
                        : appCtrl.appTheme.titleColor),
                    const Space(20, 0),
                    DrawerFontStyle().mulishtextLayout(
                        text: title, fontSize: fontSize!, color:  index == 9
                        ? appCtrl.appTheme.titleColor
                        : index == appCtrl.drawerSelectedIndex
                        ? appCtrl.appTheme.drawerSelectColor
                        : appCtrl.appTheme.titleColor),
                  ],
                ),
                (title == "Theme")
                    ? ThemeSwitcher(
                        inActiveIconColor: appCtrl.appTheme.gray,
                        inactiveColor: appCtrl.appTheme.white,
                        activeColor: appCtrl.appTheme.titleColor,
                        activeIconColor: appCtrl.appTheme.green,
                        onToggle: onToggle,
                        toggleColor: appCtrl.appTheme.greyBGColor,
                        status2: appCtrl.isTheme,
                        iconColor: index == 9
                            ? appCtrl.appTheme.titleColor
                            : index == appCtrl.drawerSelectedIndex
                            ? appCtrl.appTheme.drawerSelectColor
                            : appCtrl.appTheme.titleColor,
                      )
                    : DrawerStyle().forwardArrow(color:index == appCtrl.drawerSelectedIndex
                    ? appCtrl.appTheme.whiteColor
                    : appCtrl.appTheme.arrowSelectColor, context: context)
              ],
            )),
      );
    });
  }
}
