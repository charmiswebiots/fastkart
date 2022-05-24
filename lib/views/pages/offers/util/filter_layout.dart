import '../../../../config.dart';

class FilterLayout extends StatelessWidget {
  const FilterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<OfferController>(builder: (offerCtrl) {
        return Directionality(
            textDirection:
                offerCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              OfferFontStyle().mulishtextLayout(
                  text: OfferFont().filter,
                  fontSize: OfferFontSize.textSizeMedium,
                  color: appCtrl.appTheme.titleColor),
              const Space(0, 20),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppArray().shopFilterList.length,
                itemBuilder: (context, index) {
                  return FilterListCard(
                    index: index,
                    itemFilterIndex: offerCtrl.itemFilterIndex,
                    onTap: () async {
                      offerCtrl.itemFilterIndex = index;
                      offerCtrl.update();
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 7),
                ),
              ),
              const Space(0, 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonPopUpButton(
                      onTap: () => Get.back(),
                      containerColor: appCtrl.appTheme.popUpColor,
                      borderColor: appCtrl.appTheme.primary,
                      textColor: appCtrl.appTheme.primary,
                      text: OfferFont().close),
                  CommonPopUpButton(
                      onTap: () => Get.back(),
                      containerColor: appCtrl.appTheme.primary,
                      borderColor: appCtrl.appTheme.primary,
                      textColor: appCtrl.appTheme.whiteColor,
                      text: OfferFont().apply)
                ],
              )
            ]));
      });
    });
  }
}
