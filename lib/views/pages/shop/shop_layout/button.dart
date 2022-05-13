import '../../../../config.dart';

class OfferButton extends StatelessWidget {
  const OfferButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonPopUpButton(
                onTap: () => Get.back(),
                containerColor: appCtrl.appTheme.popUpColor,
                borderColor: appCtrl.appTheme.primary,
                textColor: appCtrl.appTheme.primary,
                text: ShopFont().close),
            CommonPopUpButton(
                onTap: () => Get.back(),
                containerColor: appCtrl.appTheme.primary,
                borderColor: appCtrl.appTheme.primary,
                textColor: appCtrl.appTheme.whiteColor,
                text: ShopFont().cancel),
          ],
        );
      }
    );
  }
}
