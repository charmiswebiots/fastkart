import 'package:fastkart/views/pages/home_screen/home_layout/banner_content.dart';
import 'package:fastkart/widgets/tranform_layout.dart';
import '../../../../config.dart';

class BannerCard extends StatelessWidget {
  final int? itemIndex;
  const BannerCard({Key? key,this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
      child: ClipRRect(
          borderRadius: BorderRadius.all(
              Radius.circular(AppScreenUtil().borderRadius(15))),
          child: Stack(
            children: <Widget>[
              TransformLayout(
                child: Image.asset(
                  AppArray().bannerList[itemIndex!].backgroundImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              BannerContent(itemIndex: itemIndex,)
            ],
          )),
    );
  }
}
