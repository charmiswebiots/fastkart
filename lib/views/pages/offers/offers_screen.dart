import '../../../config.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var offerCtrl = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return GetBuilder<OfferController>(builder: (_) {
        return Scaffold(
          backgroundColor: offerCtrl.appCtrl.appTheme.blackColor,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //search product textformfield layout
                        Padding(
                          padding: EdgeInsets.only(

                              right: AppScreenUtil().screenHeight(15)),
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonSearchTextForm(
                                  text: OfferFont().searchProduct,
                                  borderColor: offerCtrl
                                      .appCtrl.appTheme.primary
                                      .withOpacity(.3),
                                  hintColor: offerCtrl
                                      .appCtrl.appTheme.contentColor,
                                  fillcolor: offerCtrl
                                      .appCtrl.appTheme.textBoxColor,
                                  titleColor:
                                      offerCtrl.appCtrl.appTheme.titleColor,
                                ),
                              ),

                              OfferWidget().filterText(
                                  onTap: () => offerCtrl.filterbottomSheet(
                                      context: context),
                                  color:
                                      offerCtrl.appCtrl.appTheme.primary),
                            ],
                          ),
                        ),

                        const Space(0, 20),
                       const OfferListLayout()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
