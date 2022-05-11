import 'package:fastkart/config.dart';
import 'package:fastkart/views/pages/offers/util/filterLayout.dart';
import 'package:fastkart/views/pages/offers/util/offer_detail.dart';

class OfferController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int itemfilterIndex = 0;

  //offer detail bottom sheet
  bottomSheet({data, context}) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
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
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return GetBuilder<OfferController>(builder: (_) {
          return OfferWidget().popLayout(
              context: context,
              child: FilterLayout());
        });
      },
    );
  }
}
