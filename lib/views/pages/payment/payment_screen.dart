import 'package:fastkart/controllers/payment_controller.dart';

import 'package:fastkart/views/pages/payment/cardListCard.dart';
import 'package:fastkart/views/pages/payment/cashOnDelivery.dart';
import 'package:fastkart/views/pages/payment/creditDebitCard.dart';
import 'package:fastkart/views/pages/payment/netBankingCard.dart';
import 'package:fastkart/views/pages/payment/selectCardLayout.dart';
import 'package:fastkart/views/pages/payment/util/netBankingListCard.dart';

import 'package:fastkart/views/pages/payment/util/payment_constants.dart';
import 'package:fastkart/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fastkart/views/pages/payment/util/payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class PaymentScreen extends StatelessWidget {
  var paymentCtrl = Get.put(PaymentController());

  PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<PaymentController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: paymentCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: PaymentWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: paymentCtrl.appCtrl.appTheme.titleColor,
                  iconColor: paymentCtrl.appCtrl.appTheme.titleColor,
                  image: paymentCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: PaymentWidget().appBarTitleLayout(
                  text: PaymentFont().addPaymentMethod,
                  textColor: paymentCtrl.appCtrl.appTheme.titleColor),
            ),
            backgroundColor: paymentCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: Container(
                color: paymentCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          children: [
                            PaymentWidget().addAddressLayout(
                                context: context,
                                borderColor:
                                    paymentCtrl.appCtrl.appTheme.contentColor,
                                color: paymentCtrl
                                    .appCtrl.appTheme.darkContentColor),
                            Space(0, 10),

                            //select card Layout
                            Container(

                              height: AppScreenUtil().screenHeight(
                                  paymentCtrl.isShowNetBanking &&
                                          paymentCtrl.isShowWallet
                                      ? 300
                                      : 350),
                              child: ListView.builder(

                                itemCount: paymentCtrl.paymentMethodList.length,
                                itemBuilder: (context, index) {
                                  return  SelectCardLayout(
                                          index: index,
                                    initiallyExpanded: index == paymentCtrl.selected,
                                          keys: Key(index.toString()),
                                          //a
                                          titleColor: paymentCtrl
                                              .appCtrl.appTheme.titleColor,
                                          onExpansionChanged: (bool expanded) {
                                            print(expanded);
                                            if (expanded)
                                              paymentCtrl.selected = index;
                                            else
                                              paymentCtrl.selected =  -1;
                                            paymentCtrl.update();
                                          },
                                          text: paymentCtrl
                                              .paymentMethodList[index]['title']
                                              .toString(),
                                          isShow: paymentCtrl.isShow,
                                          contentColor: paymentCtrl
                                              .appCtrl.appTheme.contentColor,
                                          child:index == 0
                                              ? ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: paymentCtrl
                                                  .paymentMethodList[index]
                                                      ['child']
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int indexs) {
                                                return CardList(
                                                    onTap: () => paymentCtrl
                                                        .selectCard(indexs),
                                                    data: paymentCtrl
                                                            .paymentMethodList[index]
                                                        ['child'][indexs],
                                                    wishtListBoxColor:
                                                        paymentCtrl
                                                            .appCtrl
                                                            .appTheme
                                                            .wishtListBoxColor,
                                                    selectedIndex: paymentCtrl
                                                        .selectedIndex,
                                                    index: indexs,
                                                    primary: paymentCtrl.appCtrl
                                                        .appTheme.primary,
                                                    titleColor: paymentCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .titleColor,
                                                    containerColor: paymentCtrl
                                                        .appCtrl
                                                        .appTheme
                                                        .white);
                                              }): GridView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppScreenUtil()
                                                    .screenWidth(10)),
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: paymentCtrl
                                                .paymentMethodList[index]
                                            ['child']
                                                .length,
                                            itemBuilder: (context, indexs) {
                                              return NetBankingListCard(
                                                index: indexs,
                                                primaryColor: paymentCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .primary,
                                                selectindex: paymentCtrl
                                                    .netBlankingIndex,
                                                onTap: () => paymentCtrl
                                                    .selectNetBanking(
                                                    indexs),
                                                data: paymentCtrl
                                                    .paymentMethodList[
                                                index]['child'][indexs],
                                                titleColor: paymentCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor,
                                              );
                                            },
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width /
                                                    (MediaQuery.of(
                                                        context)
                                                        .size
                                                        .height /
                                                        8)),
                                          ),
                                        )
                                      ;

                                },
                              ),
                            ),

                            //price detail
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenHeight(20)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PaymentFontStyle().mulishtextLayout(
                                      text: PaymentFont().orderDetails,
                                      color: paymentCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize: PaymentFontSize.textSizeMedium,
                                      fontWeight: FontWeight.w600),
                                  Space(0, 15),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().bagTotal,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: PaymentFont().dollar + '220.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().bagSavings,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: '-${PaymentFont().dollar}20.00',
                                      fontWeight: FontWeight.normal,
                                      valColor:
                                          paymentCtrl.appCtrl.appTheme.primary),
                                  Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().couponDiscount,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: 'Apply Coupon',
                                      fontWeight: FontWeight.normal,
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.redColor),
                                  Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().delivery,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      fontWeight: FontWeight.normal,
                                      val: PaymentFont().dollar + '50.00',
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  Space(0, 10),
                                  Divider(),
                                  Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().totalAmount,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontWeight: FontWeight.w600,
                                      val: PaymentFont().dollar + '270.00',
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.titleColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PaymentWidget().proceedPaymentButtonLayout(
                        context: context,
                        buttonColor: paymentCtrl.appCtrl.appTheme.primary,
                        itemColor: paymentCtrl.appCtrl.appTheme.white)
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
/*

    : index == 1
? NetBakingLayout(
index: index,

isExpandable:
paymentCtrl.isExpandable,
keys: Key(index.toString()),
//a
titleColor: paymentCtrl
    .appCtrl.appTheme.titleColor,
onExpansionChanged:
(bool expanded) {
print(index);
paymentCtrl.key = UniqueKey();
paymentCtrl.isExpandable = !paymentCtrl.isExpandable;
paymentCtrl.isShowNetBanking =
!paymentCtrl
    .isShowNetBanking;
print(paymentCtrl.selected);
paymentCtrl.update();
},
text: paymentCtrl
    .paymentMethodList[index]
['title']
.toString(),
isShow:
paymentCtrl.isShowNetBanking,
contentColor: paymentCtrl.appCtrl
    .appTheme.contentColor,
child: GridView.builder(
padding: EdgeInsets.symmetric(
horizontal: AppScreenUtil()
    .screenWidth(10)),
physics:
const NeverScrollableScrollPhysics(),
shrinkWrap: true,
itemCount: paymentCtrl
    .paymentMethodList[index]
['child']
.length,
itemBuilder: (context, indexs) {
return NetBankingListCard(
index: indexs,
primaryColor: paymentCtrl
    .appCtrl
    .appTheme
    .primary,
selectindex: paymentCtrl
    .netBlankingIndex,
onTap: () => paymentCtrl
    .selectNetBanking(
indexs),
data: paymentCtrl
    .paymentMethodList[
index]['child'][indexs],
titleColor: paymentCtrl
    .appCtrl
    .appTheme
    .titleColor,
);
},
gridDelegate:
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 0,
mainAxisSpacing: 0,
childAspectRatio: MediaQuery
    .of(context)
.size
    .width /
(MediaQuery.of(
context)
.size
    .height /
8)),
),
)
: index == 2
? CreditDebitCard(
keys: Key(index.toString()),
//a
titleColor: paymentCtrl
    .appCtrl
    .appTheme
    .titleColor,
onExpansionChanged:
(bool expanded) {
paymentCtrl.isShowWallet =
!paymentCtrl
    .isShowWallet;
paymentCtrl.update();
},
text: paymentCtrl
    .paymentMethodList[index]
['title']
.toString(),
isShow:
paymentCtrl.isShowWallet,
contentColor: paymentCtrl
    .appCtrl
    .appTheme
    .contentColor,
child: GridView.builder(
padding:
EdgeInsets.symmetric(
horizontal:
AppScreenUtil()
    .screenWidth(
10)),
physics:
const NeverScrollableScrollPhysics(),
shrinkWrap: true,
itemCount: paymentCtrl
    .paymentMethodList[
index]['child']
.length,
itemBuilder:
(context, indexs) {
return NetBankingListCard(
index: indexs,
primaryColor:
paymentCtrl
    .appCtrl
    .appTheme
    .primary,
selectindex: paymentCtrl
    .walletIndex,
onTap: () => paymentCtrl
    .selectCreditDebit(
indexs),
data: paymentCtrl
    .paymentMethodList[
index]['child'][indexs],
titleColor: paymentCtrl
    .appCtrl
    .appTheme
    .titleColor,
);
},
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 0,
mainAxisSpacing: 0,
childAspectRatio: MediaQuery
    .of(context)
.size
    .width /
(MediaQuery.of(
context)
.size
    .height /
8)),
),
)
: CashOnDeliveryLayout(
keys: Key(index.toString()),
//a
titleColor: paymentCtrl
    .appCtrl
    .appTheme
    .titleColor,
onExpansionChanged:
(bool expanded) {
paymentCtrl.isShowWallet =
!paymentCtrl
    .isShowWallet;
paymentCtrl.update();
},
text: paymentCtrl
    .paymentMethodList[index]
['title']
.toString(),
isShow:
paymentCtrl.isShowWallet,
contentColor: paymentCtrl
    .appCtrl
    .appTheme
    .contentColor,
primary: paymentCtrl
    .appCtrl.appTheme.primary,
wishtListBoxColor: paymentCtrl
    .appCtrl
    .appTheme
    .wishtListBoxColor,
containerColor: paymentCtrl
    .appCtrl.appTheme.white)*/
