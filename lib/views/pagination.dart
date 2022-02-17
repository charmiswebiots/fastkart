import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';
import 'package:fastkart/controllers/pagination_controller.dart';
import 'package:fastkart/widgets/infinite_widgets/first_page_error_widget.dart';
import 'package:fastkart/widgets/infinite_widgets/next_page_error_widget.dart';
import 'package:fastkart/widgets/infinite_widgets/no_data_widget.dart';
import 'package:fastkart/widgets/infinite_widgets/progress_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Pagination extends StatelessWidget {
  var paginationCtrl = Get.put(PaginationController());
  Pagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination"),
      ),
      body: AppComponent(
        child: GetBuilder<PaginationController>(
          builder: (_) {
            return RefreshIndicator(
              onRefresh: paginationCtrl.refreshData,
              child: PagedListView(
                pagingController: paginationCtrl.pagingController,
                addAutomaticKeepAlives: true,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  itemBuilder: (context, item, index) {
                    return const Text("Data");
                  },
                  noItemsFoundIndicatorBuilder: (_) => NoDataWidget(),
                  firstPageErrorIndicatorBuilder: (_) => FirstPageErrorWidget(pagingController: paginationCtrl.pagingController),
                  newPageErrorIndicatorBuilder: (_) => NextPageErrorWidget(pagingController: paginationCtrl.pagingController),
                  firstPageProgressIndicatorBuilder: (_) => ProgressIndicatorWidget(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
