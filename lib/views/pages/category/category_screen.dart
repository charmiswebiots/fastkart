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
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //search product textformfield layout
                    CommonSearchTextForm(
                      text: CategoryFont().searchProduct,
                      borderColor: categoryCtrl.appCtrl.appTheme.primary
                          .withOpacity(.3),
                      hintColor: categoryCtrl.appCtrl.appTheme.contentColor,
                      fillcolor: categoryCtrl.appCtrl.appTheme.textBoxColor,
                      titleColor: categoryCtrl.appCtrl.appTheme.titleColor,
                    ),
                    const Space(0, 20),

                    //category and subcategory layout
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Category layout
                        CategoryWidget().categoryLayout(
                          context: context,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: AppArray().categoryData.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => categoryCtrl.onTap(index),
                                child: CategoryData(
                                  data: AppArray().categoryData[index],
                                  index: index,
                                  selectIndex: categoryCtrl.selectIndex,
                                  selectColor: categoryCtrl
                                      .appCtrl.appTheme.whiteColor,
                                  lastIndex:
                                      AppArray().categoryData.length - 1,
                                  listviewBGColor: categoryCtrl
                                      .appCtrl.appTheme.arrowSelectColor,
                                  primaryColor:
                                      categoryCtrl.appCtrl.appTheme.primary,
                                ),
                              );
                            },
                          ),
                          listviewBGColor: categoryCtrl
                              .appCtrl.appTheme.arrowSelectColor,
                        ),
                        CategoryWidget().subCategoryImageAndList(
                            context: context,
                            data: categoryCtrl.subCategoryList)
                      ],
                    ),
                    const Space(0, 20)
                  ],
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
