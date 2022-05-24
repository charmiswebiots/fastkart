import '../../config.dart';

class ShopCategoryShimmer extends StatelessWidget {
  const ShopCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: AppScreenUtil().screenHeight(50),
          color: appCtrl.appTheme.darkGray.withOpacity(.1),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(15),left: AppScreenUtil().screenWidth( index == 0? 15: 0),bottom:  AppScreenUtil().screenHeight(15),right:  AppScreenUtil().screenHeight(10),),
              child: CommonShimmerWidget()
                  .commonShimmer(
                  color: appCtrl.appTheme.lightGray.withOpacity(.5),
                  borderRadius: 2,
                  borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                  width: 80,
                  height: 6),
            ),
          ),
        );
      }
    );
  }
}
