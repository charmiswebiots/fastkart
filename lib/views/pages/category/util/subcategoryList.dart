import 'package:fastkart/config.dart';

class SubCategoryList extends StatelessWidget {
  var data;
  SubCategoryList({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.toNamed(routeName.shopScreen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(10),
                        horizontal: AppScreenUtil().screenWidth(10)),
                    height: AppScreenUtil().screenHeight(55),
                    width: AppScreenUtil().screenWidth(70),
                    decoration: BoxDecoration(
                        color: appCtrl.appTheme.textBoxColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      data[index]["image"].toString(),
                      height: AppScreenUtil().screenHeight(40),
                      width: AppScreenUtil().screenWidth(40),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Space(0, 5),
                  CategoryFontStyle().mulishtextLayout(
                      color: appCtrl.appTheme.darkGray,
                      text: data[index]['title'].toString(),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      overflow: TextOverflow.clip)
                ],
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / (1.4)),
          ),
        ),
      );
    });
  }
}
