import 'package:fastkart/config.dart';
import 'package:fastkart/utilities/responsive_layout.dart';


class ShopByCategory extends StatelessWidget {
 const ShopByCategory({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) {
        return Container(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: AppArray().categoryData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: ()async{
                  await ctrl.getStorage.write(
                      'selectedIndex', ctrl.selectedIndex);
                  ctrl.selectedIndex = 1;
                  ctrl.update();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: AppScreenUtil().screenHeight(50),
                          width: AppScreenUtil().screenWidth(65),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppArray().categoryData[index].color,
                                  width: 2),
                              color: AppArray().categoryData[index].containercolor,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          //   margin: EdgeInsets.only(),
                          padding: EdgeInsets.only(
                              top: AppScreenUtil().screenHeight(20),
                              left: AppScreenUtil().size(0)),
                          child: Image.asset(
                            AppArray().categoryData[index].image,
                            height: AppScreenUtil().screenHeight(45),
                            width: AppScreenUtil().screenWidth(45),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    Space(0, 5),
                    HomeFontStyle().mulishtextLayout(
                        color: ctrl.appTheme.titleColor,
                        text: AppArray().categoryData[index].title.toString(),
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        overflow: TextOverflow.clip)
                  ],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /(ResponsiveWidget.isSmallScreen(context) ? 1.4: 1.6)),
            ),
          ),
        );
      }
    );
  }
}
