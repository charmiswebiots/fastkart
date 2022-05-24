import '../../../../config.dart';

class CommonCancelCloseApplyButton extends StatelessWidget {
  final String? button1;
  final String? button2;
  const CommonCancelCloseApplyButton({Key? key,this.button1,this.button2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonPopUpButton(
              onTap: () => Get.back(),
              containerColor: appCtrl.appTheme.popUpColor,
              borderColor: appCtrl.appTheme.primary,
              textColor: appCtrl.appTheme.primary,
              text: button1),
          CommonPopUpButton(
              onTap: () => Get.back(),
              containerColor: appCtrl.appTheme.primary,
              borderColor: appCtrl.appTheme.primary,
              textColor: appCtrl.appTheme.whiteColor,
              text: button2),
        ],
      );
    });
  }
}
