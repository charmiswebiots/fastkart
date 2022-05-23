import '../../../../config.dart';

class CategoryData extends StatelessWidget {
  final dynamic data;
  final int? index;
  final int? lastIndex;
  final int? selectIndex;

  const CategoryData({
    Key? key,
    this.data,
    this.index,
    this.lastIndex,
    this.selectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        decoration: BoxDecoration(
          color: index == selectIndex
              ? appCtrl.appTheme.whiteColor
              : appCtrl.appTheme.arrowSelectColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                  AppScreenUtil().borderRadius(index == 0 ? 5 : 0)),
              bottomRight: Radius.circular(
                  AppScreenUtil().borderRadius(index == lastIndex ? 5 : 0))),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(8)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CategoryWidget().imageLayout(data.image),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(5)),
                          child: CategoryFontStyle().mulishtextLayout(
                            text: data.title,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        )
                      ])),
              if (index != lastIndex)
                Divider(
                  color: index == selectIndex
                      ? appCtrl.appTheme.whiteColor
                      : appCtrl.appTheme.primary.withOpacity(.1),
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                )
            ]),
      );
    });
  }
}
