import '../../../../config.dart';

class AddAddressLayout extends StatelessWidget {
  final TextEditingController? txtName;
  final TextEditingController? txtAddress;
  final TextEditingController? txtCity;
  final TextEditingController? txtState;
  final TextEditingController? txtZip;
  final GestureTapCallback? closeTap;
  final GestureTapCallback? applyTap;

  const AddAddressLayout(
      {Key? key,
      this.txtName,
      this.txtState,
      this.txtCity,
      this.txtAddress,
      this.txtZip,
      this.applyTap,
      this.closeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<AddressListController>(builder: (ctrl) {
        return Directionality(
          textDirection:
          ctrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: PaymentStyle().addCardLayout(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PaymentWidget().addCardText(appCtrl.appTheme.titleColor),
                      const Space(0, 20),
                      //address name textFormField layout
                      CommonTextFormField(
                        controller: txtName,
                        text: AddressListFont().nameHint,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                      const Space(0, 15),
                      //address apartment, studio textFormField layout
                      CommonTextFormField(
                        controller: txtAddress,
                        text: AddressListFont().apartmentStudioOrFloor,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                      const Space(0, 15),
                      //city textFormField layout
                      CommonTextFormField(
                        controller: txtCity,
                        text: AddressListFont().city,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                      const Space(0, 15),
                      //state textFormField layout
                      CommonTextFormField(
                        controller: txtState,
                        text: AddressListFont().state,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                      const Space(0, 15),
                      //zip textFormField layout
                      CommonTextFormField(
                        controller: txtZip,
                        text: AddressListFont().zip,
                        borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                        hintColor: appCtrl.appTheme.contentColor,
                        fillcolor: appCtrl.appTheme.textBoxColor,
                      ),
                      const Space(0, 15),
                    ],
                  ),
                  AddressListStyle().cancelSubmit(
                      whiteColor: appCtrl.appTheme.whiteColor,
                      primaryColor: appCtrl.appTheme.primary,
                      popUpColor: appCtrl.appTheme.popUpColor)
                ],
              ),
              context: context),
        );
      });
    });
  }
}
