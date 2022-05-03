import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/app_array.dart';
import 'package:flutter/cupertino.dart';

class PaymentController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int? selected;
  int selectedIndex = 0;
  int netBlankingIndex = 0;
  int walletIndex = 0;
  bool isShow = false;
  bool isShowNetBanking = false;
  bool isShowWallet = false;
  bool isShowCash = false;
  var key = -1;
  List cardList = [];
  List paymentMethodList = [];
  List netBankingList = [];
  List creditDebitCardList = [];

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

  @override
  void onInit() {
    // TODO: implement onInit

    paymentMethodList = AppArray().paymentMethodList;
    update();
    super.onInit();
  }
}
