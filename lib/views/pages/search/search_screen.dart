import 'package:fastkart/views/pages/search/search_layout/search_body_layout.dart';

import '../../../config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchCtrl = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) {
        return GetBuilder<SearchController>(builder: (_) {
          return Scaffold(
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: searchCtrl.appCtrl.isShimmer
                  ? const SearchPageShimmer()
                  : const SearchBodyLayout(),
            ),
          );
        });
      }
    );
  }
}
