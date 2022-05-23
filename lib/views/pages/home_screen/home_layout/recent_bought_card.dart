import '../../../../config.dart';

class RecentBoughtCard extends StatelessWidget {
  final dynamic list;
  final int? index;
  const RecentBoughtCard({Key? key,this.list,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: () => Get.toNamed(routeName.productDetail),
          child: Container(
            margin: EdgeInsets.only(
                right: AppScreenUtil().size(15)),
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().size(12),
                horizontal: AppScreenUtil().size(12)),
            decoration: BoxDecoration(
                color: appCtrl.appTheme.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              list['image'].toString(),
              fit: BoxFit.fill,
              height: AppScreenUtil().size(30),
              width: AppScreenUtil().size(30),
            ),
          ),
        );
      }
    );
  }
}
