import '../../../../config.dart';

class FilterListCard extends StatelessWidget {
  final int? itemFilterIndex;
  final int? index;
  final GestureTapCallback? onTap;
  const FilterListCard({Key? key,this.onTap,this.index,this.itemFilterIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: index == itemFilterIndex
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
                    .shopFilterList[index!]['title']
                    .toString(),
                fontSize: OfferFontSize.textSizeSMedium,
                color: index == itemFilterIndex
                    ? appCtrl.appTheme.white
                    : appCtrl.appTheme.darkContentColor),
          ),
        );
      }
    );
  }
}
