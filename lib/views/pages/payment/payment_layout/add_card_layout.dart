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
        return Directionality(
          textDirection:
              ctrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: PaymentStyle().addCardLayout(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaymentWidget().addCardText(appCtrl.appTheme.titleColor),
                  const Space(0, 20),
                  //card holder name textformfield layout
                  CommonTextFormField(
                    controller: txtName,
                    text: PaymentFont().cardHolderName,
                    borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                    hintColor: appCtrl.appTheme.contentColor,
                    fillcolor: appCtrl.appTheme.textBoxColor,
                  ),
                  const Space(0, 15),
                  //card holder name textformfield layout
                  CommonTextFormField(
                    controller: txtnumber,
                    text: PaymentFont().cardNumber,
                    borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                    hintColor: appCtrl.appTheme.contentColor,
                    fillcolor: appCtrl.appTheme.textBoxColor,
                  ),
                  const Space(0, 15),
                  //card holder name textformfield layout
                  CardHolderLayout(txtExpiryDate: txtExpiryDate, txtCV: txtCV),
                  const Space(0, 15),
                  CommonCancelCloseApplyButton(
                    button1: ProductDetailFont().close,
                    button2: ProductDetailFont().apply,
                  )
                ],
              ),
              context: context),
        );
      });
    });
  }
}
