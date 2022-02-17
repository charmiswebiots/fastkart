import 'package:fastkart/config.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationController extends GetxController {
  final PagingController pagingController = PagingController(firstPageKey: 0);
  static const _pageSize = 15;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getData(pageKey);
    });

    super.onInit();
  }

  Future refreshData() async {
    return getData(0);
  }

  void getData(pageKey) async {
    try {
      var formData = {
        "skip": pageKey,
        "take": _pageSize,
      };


    } catch (exception, stackTrace) {
      pagingController.error = exception;

    }
  }
}
