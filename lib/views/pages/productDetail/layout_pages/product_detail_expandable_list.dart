import '../../../../config.dart';

class ProductDetailExpandableList extends StatelessWidget {
  final bool? isExpanded;
  final int? index;
  final String? title;
  final String? child;

  const ProductDetailExpandableList(
      {Key? key, this.isExpanded, this.index, this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
          return Column(
            children: <Widget>[
              InkWell(
                onTap: () => productDetailCtrl.expandBox(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ProductDetailFontStyle().mulishtextLayout(
                          text: title,
                          fontWeight: FontWeight.normal,
                          fontSize: ProductDetailFontSize.textSizeSMedium),
                      IconButton(
                          icon: Container(
                            height: AppScreenUtil().screenHeight(25),
                            width: AppScreenUtil().screenWidth(25),
                            decoration: BoxDecoration(
                              color: productDetailCtrl.appCtrl.appTheme.iconBgColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isExpanded!
                                  ? Icons.keyboard_arrow_down
                                  : Icons.arrow_forward_ios_outlined,
                              color: productDetailCtrl.appCtrl.appTheme.titleColor,
                              size: AppScreenUtil().size(isExpanded! ? 18 : 13),
                            ),
                          ),
                          onPressed: () => productDetailCtrl.expandBox(index)),
                    ],
                  ),
                ),
              ),
              ProductDetailChildExpandable(
                  collapsedHeight: 0.0,
                  expandedHeight: AppScreenUtil().screenHeight(
                      AppScreenUtil().screenActualWidth() > 377 ? 72 : 82),
                  expanded: isExpanded,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(15)),
                    child: ProductDetailFontStyle().mulishtextLayout(
                        text: child,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        fontSize: ProductDetailFontSize.textSizeSmall,
                        overflow: TextOverflow.clip),
                  ))
            ],
          );
        });
      }
    );
  }
}
