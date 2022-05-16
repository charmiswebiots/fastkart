import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/offers/util/filter_layout.dart';
import 'package:fastkart/views/pages/offers/util/offer_detail.dart';

class OfferController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int itemFilterIndex = 0;

  //offer detail bottom sheet
  bottomSheet({data, context}) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      context: context,
      builder: (BuildContext context) {
        return OfferDetail(
          data: data,
        );
      },
    );
  }

  //bottom sheet for filter
  filterbottomSheet({
    context,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: appCtrl.appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GetBuilder<OfferController>(builder: (_) {
          return OfferWidget()
              .popLayout(context: context, child: const FilterLayout());
        });
      },
    );
  }
}
