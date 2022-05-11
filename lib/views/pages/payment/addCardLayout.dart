import '../../../config.dart';

class AddCardLayout extends StatelessWidget {
  TextEditingController? txtName;
  TextEditingController? txtnumber;
  TextEditingController? txtExpiryDate;
  TextEditingController? txtCV;
  GestureTapCallback? closeTap;
  GestureTapCallback? applyTap;

  AddCardLayout(
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
                PaymentFontStyle().mulishtextLayout(
                    text: PaymentFont().addCard,
                    fontWeight: FontWeight.w600,
                    fontSize: ProductDetailFontSize.textSizeSMedium,
                    color: appCtrl.appTheme.titleColor),
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
                        suffixIcon: Icon(
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
                    PaymentStyle().commonButtonWidget(
                        containerColor: appCtrl.appTheme.whiteColor,
                        context: context,
                        borderColor: appCtrl.appTheme.primary,
                        onTap: closeTap,
                        textColor: appCtrl.appTheme.primary,
                        text: ProductDetailFont().close),
                    PaymentStyle().commonButtonWidget(
                        containerColor: appCtrl.appTheme.primary,
                        context: context,
                        onTap: applyTap,
                        borderColor: appCtrl.appTheme.primary,
                        textColor: appCtrl.appTheme.white,
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
