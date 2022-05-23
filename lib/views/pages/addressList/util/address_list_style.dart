import '../../../../config.dart';

class AddressListStyle{


  //cancel and submit
  Widget cancelSubmit({var primaryColor,var popUpColor,var whiteColor}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonPopUpButton(
            onTap: () => Get.back(),
            containerColor: popUpColor,
            borderColor: primaryColor,
            textColor: primaryColor,
            text: ProductDetailFont().close),
        CommonPopUpButton(
            onTap: () => Get.back(),
            containerColor: primaryColor,
            borderColor: primaryColor,
            textColor: whiteColor,
            text: ProductDetailFont().apply),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AddressListFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }
}