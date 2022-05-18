import 'package:fastkart/config.dart';

class TitleHorizontalList extends StatelessWidget {
  const TitleHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          height: AppScreenUtil().screenHeight(30),
          child: ListView.builder(
            itemCount: 5,

            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
              child: CommonShimmerWidget().commonShimmer(
              color: appCtrl.appTheme.lightGray.withOpacity(.5),
              borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
              borderRadius: 5,
              height: 30,
              width: 100,child:
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10),vertical: AppScreenUtil().screenWidth(10)),
                child: CommonShimmerWidget().commonShimmer(
                    color: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                    borderRadius: 5,
                    height: 4,
                    width: 60
                ),
              )
          ),
            ),),
        );
      }
    );
  }
}
