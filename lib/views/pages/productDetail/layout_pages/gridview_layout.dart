import '../../../../config.dart';

class GridViewLayoutCard extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? quantityIndex;
  final GestureTapCallback? onTap;

  const GridViewLayoutCard(
      {Key? key,
      this.data,
      this.quantityIndex,
      this.index,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (ctrl) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(2),
            decoration: BoxDecoration(
              color: ctrl.appCtrl.appTheme.wishtListBoxColor,
              borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
              border: Border.all(
                  color: quantityIndex == index ? ctrl.appCtrl.appTheme.primary : ctrl.appCtrl.appTheme.contentColor.withOpacity(.5),
                  width: 1), //border of dropdown button
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(10)),
                  alignment: Alignment.centerLeft,
                  child: ProductDetailFontStyle().mulishtextLayout(
                      text: data['title'].toString(),
                      fontSize: ProductDetailFontSize.textSizeSMedium,
                      color: ctrl.appCtrl.appTheme.titleColor),
                ),
                if (quantityIndex == index)
                  ProductDetailStyle().checkIcon(
                      containerColor: ctrl.appCtrl.appTheme.primary, iconColor: ctrl.appCtrl.appTheme.white),
              ],
            ),
          ),
        );
      }
    );
  }
}
