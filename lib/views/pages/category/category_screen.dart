import '../../../config.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var categoryCtrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return GetBuilder<CategoryController>(builder: (_) {
        return Directionality(
            textDirection: categoryCtrl.appCtrl.isRTL ||
                    categoryCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Scaffold(
                body: categoryCtrl.appCtrl.isShimmer
                    ? const CategoryListShimmer()
                    : Stack(
                        alignment: Alignment.bottomCenter,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: Column(children: [
                              //search product textformfield layout
                              CommonSearchTextForm(
                                text: CategoryFont().searchProduct,
                                borderColor: categoryCtrl
                                    .appCtrl.appTheme.primary
                                    .withOpacity(.3),
                                hintColor:
                                    categoryCtrl.appCtrl.appTheme.contentColor,
                                fillcolor:
                                    categoryCtrl.appCtrl.appTheme.textBoxColor,
                                titleColor:
                                    categoryCtrl.appCtrl.appTheme.titleColor,
                              ),
                              const Space(0, 20),

                              //category and subcategory layout
                              const ListLayout(),
                              const Space(0, 20)
                            ]),
                          )
                        ],
                      )));
      });
    });
  }
}
