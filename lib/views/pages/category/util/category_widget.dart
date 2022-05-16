import 'package:fastkart/config.dart';

//Widget Layout
class CategoryWidget {
  //category layout
  Widget categoryLayout({context, var listviewBGColor, child}) {
    return Container(
      width: MediaQuery.of(context).size.width /
          AppScreenUtil()
              .screenWidth(AppScreenUtil().screenActualWidth() > 377 ? 2.9 : 3),
      decoration: BoxDecoration(
          color: listviewBGColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(10)),
              bottomRight: Radius.circular(AppScreenUtil().borderRadius(10)))),
      child: child,
    );
  }

  //sub category layout
  Widget subCaegoryLayout({context, child}) {
    return Container(
      margin: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(15),
          left: AppScreenUtil().screenWidth(10)),
      width: MediaQuery.of(context).size.width /
          AppScreenUtil().screenWidth(
              AppScreenUtil().screenActualWidth() > 375 ? 1.5 : 1.7),
      child: child,
    );
  }

  //sub category and category list layout and
  Widget subCategoryImageAndList({context, data}) {
    return CategoryWidget().subCaegoryLayout(
        context: context,
        child: Column(
          children: [
            //Image layout
            const ImageBgLayout(),

            //subCategory list layout
            SubCategoryList(
              data: data,
            )
          ],
        ));
  }
}
