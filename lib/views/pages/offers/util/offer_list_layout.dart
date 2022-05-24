import '../../../../config.dart';

class OfferListLayout extends StatelessWidget {

  const OfferListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<OfferController>(
          builder: (offerCtrl) {
            return Container(
              margin: EdgeInsets.only(
                  left: AppScreenUtil().screenHeight(15),
                  right: AppScreenUtil().screenHeight(15)),
              child: ListView.builder(
                itemCount: offerCtrl.myOfferList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OfferListCardLayout(
                    primaryColor: appCtrl.appTheme.primary,
                    whiteColor: appCtrl.appTheme.white,
                    isTheme: appCtrl.isTheme,
                    onTap: () => offerCtrl.bottomSheet(
                        data: offerCtrl.myOfferList[index],),
                    data: AppArray().myOfferList[index],
                  );
                },
              ),
            );
          }
        );
      }
    );
  }
}
