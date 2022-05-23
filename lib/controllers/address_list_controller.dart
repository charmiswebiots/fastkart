import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/addressList/util/add_address_bottom_sheet.dart';

class AddressListController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
TextEditingController txtName = TextEditingController();
TextEditingController txtAddress = TextEditingController();
TextEditingController txtCity = TextEditingController();
TextEditingController txtState = TextEditingController();
TextEditingController txtZip = TextEditingController();
  int selectedIndex =0;


  //select Address
  selectAddress(index){
    selectedIndex = index;
    update();
  }

// add address bottom sheet
  addAddressBottomSheet({
    context,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: appCtrl.appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GetBuilder<AddressListController>(builder: (_) {
          return AddAddressLayout(
            txtName: txtName,
            txtAddress: txtAddress,
            txtCity: txtCity,
            txtState: txtState,
            txtZip: txtZip,
            closeTap: () => Get.back(),
            applyTap: () => Get.back(),
          );
        });
      },
    );
  }
}