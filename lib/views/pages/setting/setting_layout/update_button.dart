
import '../../../../config.dart';

class UpdateSettingButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const UpdateSettingButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingCtrl) {
        return InkWell(
          onTap: onTap,
          child:  Container(
            padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(15)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: settingCtrl.appCtrl.appTheme.primary,
                borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))
            ),
            child: SettingFontStyle().mulishtextLayout(text: SettingFont().updateSettings,fontSize: SettingFontSize.textSizeSmall,color: settingCtrl.appCtrl.appTheme.white,fontWeight: FontWeight.w700),
          ),
        );
      }
    );
  }
}
