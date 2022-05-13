import '../../../../config.dart';

class AddCardLayout extends StatelessWidget {
  final TextEditingController? txtName;
  final TextEditingController? txtnumber;
  final TextEditingController? txtExpiryDate;
  final TextEditingController? txtCV;
  final GestureTapCallback? closeTap;
  final GestureTapCallback? applyTap;

  const AddCardLayout(
      {Key? key,
      this.txtName,
      this.txtCV,
      this.txtExpiryDate,
      this.txtnumber,
      this.applyTap,
      this.closeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<PaymentController>(builder: (ctrl) {
        return PaymentStyle().addCardLayout(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentWidget().addCardText(appCtrl.appTheme.titleColor),
                Space(0, 20),
                //card holder name textformfield layout
                CommonTextFormField(
                  controller: txtName,
                  text: PaymentFont().cardHolderName,
                  borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                  hintColor: appCtrl.appTheme.contentColor,
                  fillcolor: appCtrl.appTheme.textBoxColor,
                ),
                Space(0, 15),
                //card holder name textformfield layout
                CommonTextFormField(
                  controller: txtnumber,
                  text: PaymentFont().cardNumber,
                  borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                  hintColor: appCtrl.appTheme.contentColor,
                  fillcolor: appCtrl.appTheme.textBoxColor,
                ),
                Space(0, 15),
                //card holder name textformfield layout
                Row(
                  children: [
                    Expanded(
                      child: CommonTextFormField(
                        controller: txtExpiryDate,
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                        ),
                        text: PaymentFont().expiryDate,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                    ),
                    Space(10, 0),
                    Expanded(
                      child: CommonTextFormField(
                        controller: txtCV,
                        text: PaymentFont().cv,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                    ),
                  ],
                ),
                Space(0, 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonPopUpButton(
                        onTap: () => Get.back(),
                        containerColor: appCtrl.appTheme.popUpColor,
                        borderColor: appCtrl.appTheme.primary,
                        textColor: appCtrl.appTheme.primary,
                        text: ProductDetailFont().close),
                    CommonPopUpButton(
                        onTap: () => Get.back(),
                        containerColor: appCtrl.appTheme.primary,
                        borderColor: appCtrl.appTheme.primary,
                        textColor: appCtrl.appTheme.whiteColor,
                        text: ProductDetailFont().apply),
                  ],
                )
              ],
            ),
            context: context);
      });
    });
  }
}
