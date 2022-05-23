import 'package:fastkart/widgets/tranform_layout.dart';

import '../../../../config.dart';

class ImageBgLayout extends StatelessWidget {
  const ImageBgLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(AppScreenUtil().borderRadius(15))),
            child: Stack(
              children: <Widget>[
                TransformLayout(child: Image.asset(
                  AppArray()
                      .bannerList[0].backgroundImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),),
                Positioned(
                  top: MediaQuery.of(context).size.height / 15,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryFontStyle().quicksandtextLayout(
                            text: AppArray()
                                .bannerList[0].title,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: appCtrl.appTheme.bannerTitleColor ),
                        const Space(0, 5),
                        CategoryFontStyle().quicksandtextLayout(
                            text: AppArray()
                                .bannerList[0].description,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: appCtrl.appTheme.darkContentColor ),
                        const  Space(0, 15),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                              color: appCtrl.appTheme.primary
                          ),
                          padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(5),horizontal: AppScreenUtil().screenHeight(20)),
                          child:  CategoryFontStyle().mulishtextLayout(
                              text: AppArray()
                                  .bannerList[0].buttonTitle,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color:  appCtrl.appTheme.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
      }
    );
  }
}
