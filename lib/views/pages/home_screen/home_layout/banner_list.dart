import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/widgets/tranform_layout.dart';

class BannerList extends StatelessWidget {
  BannerList({
    Key? key,
  }) : super(key: key);
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Container(
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenHeight(15),
            right: AppScreenUtil().screenHeight(15)),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          itemCount: homeCtrl.bannerList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Container(
              padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppScreenUtil().borderRadius(15))),
                  child: Stack(
                    children: <Widget>[
                      TransformLayout(
                        child: Image.asset(
                          AppArray().bannerList[itemIndex].backgroundImage,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 15,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppScreenUtil().screenWidth(20),right: AppScreenUtil().screenWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HomeFontStyle().quicksandtextLayout(
                                  text: AppArray().bannerList[itemIndex].title,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: itemIndex.isEven
                                      ? appCtrl.appTheme.bannerTitleColor
                                      : appCtrl.appTheme.white),
                              const Space(0, 5),
                              HomeFontStyle().quicksandtextLayout(
                                  text: AppArray()
                                      .bannerList[itemIndex]
                                      .description,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: itemIndex.isEven
                                      ? appCtrl.appTheme.darkContentColor
                                      : appCtrl.appTheme.white),
                              const Space(0, 15),
                              InkWell(
                                onTap: () => Get.toNamed(routeName.shopScreen),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppScreenUtil().borderRadius(5)),
                                      color: itemIndex.isEven
                                          ? appCtrl.appTheme.primary
                                          : appCtrl.appTheme.white),
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppScreenUtil().screenHeight(5),
                                      horizontal:
                                          AppScreenUtil().screenHeight(20)),
                                  child: HomeFontStyle().mulishtextLayout(
                                      text: AppArray()
                                          .bannerList[itemIndex]
                                          .buttonTitle,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: itemIndex.isEven
                                          ? appCtrl.appTheme.white
                                          : appCtrl.appTheme.primary),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      );
    });
  }
}
