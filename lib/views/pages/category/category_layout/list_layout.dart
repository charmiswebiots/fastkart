import '../../../../config.dart';

class ListLayout extends StatelessWidget {
  const ListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryCtrl) {
      return Row(
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
                    lastIndex: AppArray().categoryData.length - 1,
                  ),
                );
              },
            ),
            listviewBGColor: categoryCtrl.appCtrl.appTheme.arrowSelectColor,
          ),
          CategoryWidget().subCategoryImageAndList(
              context: context,
              bannerData: categoryCtrl.bannerList,
              data: categoryCtrl.subCategoryList)
        ],
      );
    });
  }
}
