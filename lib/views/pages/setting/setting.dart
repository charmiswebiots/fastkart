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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //user icon
                          SettingStyle().userImageLayout(
                              color: settingCtrl.appCtrl.appTheme.primary,
                              context: context,
                              image: imageAssets.usersquare,
                              height: 50),
                          const Space(0, 10),
                          //user name text layout
                          SettingStyle().userNameLayout(
                              settingCtrl.appCtrl.appTheme.titleColor),
                          const Space(0, 3),

                          //user email text layout
                          SettingStyle().userEmailLayout(
                              settingCtrl.appCtrl.appTheme.darkContentColor),

                          const Space(0, 20),
                          //fullname textformfield layout
                          const FullNameTextForm(),

                          const Space(0, 15),
                          //email textformfield layout
                          const EmailLayoutTextForm(),

                          const Space(0, 15),
                          //phone textformfield layout
                          const PhoneLayoutTextForm(),
                          const Space(0, 15),
                          //date textformfield layout
                          const DateLayoutTextForm(),
                          const Space(0, 15),
                          // password layout
                          const PasswordLayout(),
                          const Space(0, 15),
                          //Update Settings layout
                          UpdateSettingButton(onTap: () {
                            if (formKey.currentState!.validate()) {}
                          })
                        ],
                      ),
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
