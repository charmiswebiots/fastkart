import 'package:fastkart/config.dart';

class ImageHorizontalList extends StatelessWidget {
  const ImageHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (appCtrl) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
            height: AppScreenUtil().screenHeight(50),
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
                    height: 50,
                    width: 100,child:
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(25),vertical: AppScreenUtil().screenWidth(15)),
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
