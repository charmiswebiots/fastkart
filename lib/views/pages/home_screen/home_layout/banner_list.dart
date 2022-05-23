import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/home_screen/home_layout/banner_card.dart';

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
            return BannerCard(
              itemIndex: itemIndex,
            );
          },
        ),
      );
    });
  }
}
