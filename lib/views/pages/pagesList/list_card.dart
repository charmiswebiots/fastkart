import '../../../config.dart';

class PagesListCardLayout extends StatelessWidget {
  const PagesListCardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesListController>(
      builder: (pageCtrl) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: ListView.builder(
              itemCount: AppArray().pagesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () => pageCtrl.listTap(index),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: pageCtrl.appCtrl.appTheme.titleColor,
                      size: AppScreenUtil().screenHeight(18.0),
                    ),
                    title: Text(AppArray()
                        .pagesList[index]['name']
                        .toString()));
              },
            ),
          ),
        );
      }
    );
  }
}
