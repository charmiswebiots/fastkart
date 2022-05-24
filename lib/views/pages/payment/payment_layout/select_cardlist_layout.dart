import '../../../../config.dart';

class SelectCardList extends StatelessWidget {
  final dynamic data;

  const SelectCardList({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<PaymentController>(builder: (paymentCtrl) {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int indexs) {
              return CardList(
                  onTap: () => paymentCtrl.selectCard(indexs),
                  data: data[indexs],
                  wishListBoxColor:
                      paymentCtrl.appCtrl.appTheme.wishtListBoxColor,
                  selectedIndex: paymentCtrl.selectedIndex,
                  index: indexs,
                  primary: paymentCtrl.appCtrl.appTheme.primary,
                  titleColor: paymentCtrl.appCtrl.appTheme.titleColor,
                  containerColor: paymentCtrl.appCtrl.appTheme.white);
            });
      });
    });
  }
}
