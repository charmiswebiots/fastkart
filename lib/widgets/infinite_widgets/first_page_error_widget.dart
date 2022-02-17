import 'package:flutter/material.dart';
import 'package:fastkart/common/assets/index.dart';
import 'package:fastkart/config.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FirstPageErrorWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final String? title;
  final String? message;
  final PagingController pagingController;

  FirstPageErrorWidget({
    Key? key,
    this.title,
    this.message,
    required this.pagingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAssets.noImageBanner,
          ),
          const VSpace(Sizes.s10),
          Text(
            title ?? trans('first_page_error_title'),
            textAlign: TextAlign.center,
            style: AppCss.h2,
          ),
          const VSpace(Sizes.s10),
          Text(
            message ?? trans('first_page_error_msg'),
            textAlign: TextAlign.center,
            style: AppCss.body3.copyWith(color: appCtrl.appTheme.gray),
          ),
          const VSpace(Sizes.s20),
          ElevatedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: appCtrl.appTheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: Insets.i30),
            ),
            onPressed: pagingController.retryLastFailedRequest,
            child: Text(trans('retry'), style: AppCss.h3.copyWith(color: appCtrl.appTheme.white)),
          ),
        ],
      ),
    );
  }
}
