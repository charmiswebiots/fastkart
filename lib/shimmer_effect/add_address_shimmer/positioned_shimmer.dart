import 'package:fastkart/config.dart';

class PositionedShimmer extends StatelessWidget {
  const PositionedShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AppController>(
      builder: (appCtrl) {
        return Positioned(
            right: 15,
            top: MediaQuery.of(context).size.width / 1.4,
            child: CommonShimmerWidget().commonShimmer(
              color: appCtrl.appTheme.gray.withOpacity(.2),
              borderColor: appCtrl.appTheme.gray.withOpacity(.2),
              borderRadius: 100,
              width: 50,
              height: 50,
              child: Icon(Icons.circle,color: appCtrl.appTheme.darkContentColor),
            ));
      }
    );
  }
}
