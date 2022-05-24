import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/responsive_layout.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeCtrl.categoryData.length,
        itemBuilder: (context, index) {
          return ShopByCategoryData(index: index,);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height /
                  (ResponsiveWidget.isSmallScreen(context) ? 1.4 : 1.6)),
        ),
      );
    });
  }
}
