import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../config.dart';

class CommonRatingLayout extends StatelessWidget {
  final double? value;
  final ValueChanged<double>? onRatingUpdate;
  const CommonRatingLayout({Key? key,this.value,this.onRatingUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return RatingBar.builder(
        itemSize: AppScreenUtil().size(20.0),
        initialRating: value!,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        glowColor: appCtrl.appTheme.primary,
        itemPadding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(1),
            vertical: AppScreenUtil().screenHeight(5)),
        unratedColor: appCtrl.appTheme.contentColor,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: onRatingUpdate!,
      );
    });
  }
}
