import 'package:fastkart/config.dart';

class PaymentController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  bool expand = false;
  int? tapped = 0;
  int selectedIndex = 0;
  int netBlankingIndex = 0;
  int walletIndex = 0;
  bool isLoading = true;
  var key = -1;
  List paymentMethodList = [];

  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtExpiryDate = TextEditingController();
  TextEditingController txtCVe = TextEditingController();

  //select Card
  selectCard(index) {
    selectedIndex = index;
    update();
  }

  //select Address
  selectNetBanking(index) {
    netBlankingIndex = index;
    update();
  }

  //select credit-debit
  selectCreditDebit(index) {
    walletIndex = index;
    update();
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  addCardBottomSheet({
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
        return GetBuilder<PaymentController>(builder: (_) {
          return AddCardLayout(
            txtName: txtName,
            txtExpiryDate: txtExpiryDate,
            txtCV: txtCVe,
            txtnumber: txtNumber,
            closeTap: () => Get.back(),
            applyTap: () => Get.back(),
          );
        });
      },
    );
  }

  //get data
  //get data
  getData() async {
    isLoading = true;
    tapped = 0;
    expand = true;
    paymentMethodList = AppArray().paymentMethodList;
    await Future.delayed(Durations.s2);
    isLoading = false;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onInit
    getData();
    super.onReady();
  }
}
