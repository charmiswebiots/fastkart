import '../../../../config.dart';

class CommonProductDetailLayout extends StatelessWidget {
  const CommonProductDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
      return SizedBox(
        height: AppScreenUtil().screenHeight(productDetailCtrl.expand
            ? (AppScreenUtil().screenActualWidth() > 377 ? 250 : 350)
            : (AppScreenUtil().screenActualWidth() > 377 ? 200 : 250)),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () => productDetailCtrl.expandBox(index),
                child: ProductDetailExpandableList(
                    index: index,
                    isExpanded: index == productDetailCtrl.tapped
                        ? productDetailCtrl.expand
                        : false,
                    title: productDetailCtrl.detail[index]['title'],
                    child: productDetailCtrl.detail[index]['child']));
          },
          itemCount: productDetailCtrl.detail.length,
        ),
      );
    });
  }
}
