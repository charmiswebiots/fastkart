import 'package:fastkart/views/pages/setting/setting_layout/setting_body_layout.dart';

import '../../../config.dart';

class Setting extends StatelessWidget {
  final settingCtrl = Get.put(SettingController());
  final formKey = GlobalKey<FormState>();

  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<SettingController>(builder: (_) {
          return  Directionality(
            textDirection:
            settingCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              appBar: SettingWidget().appBarLayout(
                  bgColor: settingCtrl.appCtrl.appTheme.whiteColor,
                  titleColor: settingCtrl.appCtrl.appTheme.titleColor,
                  text: SettingFont().editProfile,
                  onTap: () => settingCtrl.goToHome()),
              backgroundColor: settingCtrl.appCtrl.appTheme.whiteColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(10),
                        horizontal: AppScreenUtil().screenWidth(15)),
                    margin:
                        EdgeInsets.only(top: AppScreenUtil().screenHeight(20)),
                    width: MediaQuery.of(context).size.width,
                    color: settingCtrl.appCtrl.appTheme.whiteColor,
                    child: Form(
                      key: formKey,
                      child: SettingBodyLayout(onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
