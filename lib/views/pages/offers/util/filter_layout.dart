import '../../../../config.dart';

class FilterLayout extends StatelessWidget {
  const FilterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<OfferController>(builder: (offerCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferFontStyle().mulishtextLayout(
                text: OfferFont().filter,
                fontSize: OfferFontSize.textSizeMedium,
                color: appCtrl.appTheme.titleColor),
            Space(0, 20),
            GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: AppArray().shopFilterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    offerCtrl.itemfilterIndex = index;
                    offerCtrl.update();
                  },
                  child: Container(
                    height: AppScreenUtil().screenHeight(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == offerCtrl.itemfilterIndex
                          ? appCtrl.appTheme.primary
                          : appCtrl.appTheme.wishtListBoxColor,
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(5)),
                      border: Border.all(
                          color: appCtrl.isTheme
                              ? appCtrl.appTheme.gray
                              : appCtrl.appTheme.primary.withOpacity(.2),
                          width: .5), //border of dropdown button
                    ),
                    child: OfferFontStyle().mulishtextLayout(
                        text: AppArray()
                            .shopFilterList[index]['title']
                            .toString(),
                        fontSize: OfferFontSize.textSizeSMedium,
                        color: index == offerCtrl.itemfilterIndex
                            ? appCtrl.appTheme.white
                            : appCtrl.appTheme.darkContentColor),
                  ),
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
            Space(0, 30),
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
                    text: OfferFont().apply),
              ],
            )
          ],
        );
      });
    });
  }
}
