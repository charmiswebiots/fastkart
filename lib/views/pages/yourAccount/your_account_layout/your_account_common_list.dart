import 'package:fastkart/views/pages/yourAccount/your_account_layout/icon_switcher_layout.dart';

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
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<YourAccountController>(builder: (yourAccountCtrl) {
          return Directionality(
            textDirection: yourAccountCtrl.appCtrl.isRTL
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: InkWell(
              onTap: onTap,
              child: Container(
                  margin:
                      EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8.0)),
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10),
                      horizontal: AppScreenUtil().screenWidth(10)),
                  decoration: BoxDecoration(
                      color: yourAccountCtrl.appCtrl.appTheme.whiteColor,
                      borderRadius:
                          BorderRadius.circular(AppScreenUtil().borderRadius(10))),
                  child: IconSwitcherLayout(
                    onToggleRtl: onToggleRtl,
                    onToggle: onToggle,
                    data: data,
                    indexKey: indexKey,
                  )),
            ),
          );
        });
      }
    );
  }
}
