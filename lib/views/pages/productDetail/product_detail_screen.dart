import '../../../config.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var productDetailCtrl = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => Scaffold(
        backgroundColor: productDetailCtrl.appCtrl.appTheme.wishtListBoxColor,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: productDetailCtrl.appCtrl.appTheme.wishtListBoxColor,
          leading: CommonAppBarLeading(
            onTap: () => Get.back(),
            isImage: false,
          ),
          actions: [
            ProductDetailWidget().appBarActionLayout(
              iconColor: productDetailCtrl.appCtrl.appTheme.titleColor,
            ),
          ],
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: GetBuilder<ProductDetailController>(
            builder: (_) => Stack(
              alignment: Alignment.bottomCenter,
              children: const [
                //main layout
                ProductDetailMainLayout(),

                //amount and quantity layout
                AmountButtonLayout()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
