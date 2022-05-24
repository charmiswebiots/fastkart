import 'package:fastkart/config.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CommonShimmerWidget().commonShimmer(color:appCtrl.appTheme.lightGray.withOpacity(.4) ,height: 40,width: 60,borderRadius: 10,borderColor: appCtrl.appTheme.lightGray.withOpacity(.4),),
                const Space(0, 5),
                CommonShimmerWidget().commonShimmer(color:appCtrl.appTheme.lightGray.withOpacity(.4) ,height: 5,width: 30,borderColor: appCtrl.appTheme.lightGray.withOpacity(.4)),
              ],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height /(2)),
          ),
        );
      }
    );
  }
}
