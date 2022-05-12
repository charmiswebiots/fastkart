
import '../../../config.dart';

class CommonHorizontalList extends StatelessWidget {
  final String? title;
  final String? text;
  final dynamic data;
  const CommonHorizontalList({Key? key,this.title,this.data,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //everyday essential and see all  widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeFontStyle().mulishtextLayout(
                    text: text,
                    fontWeight: FontWeight.w700,
                    fontSize: HomeFontSize.textSizeSMedium,
                    color: appCtrl.appTheme.titleColor),
                HomeFontStyle().mulishtextLayout(
                    text: CommonFont().seeAll,
                    fontSize: 12,
                    color: appCtrl.appTheme.primary,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Space(0, 5),
            //popular offers of the day text widget
            HomeFontStyle().mulishtextLayout(
                text: title,
                fontWeight: FontWeight.normal,
                fontSize: HomeFontSize.textSizeSmall,
                color: appCtrl.appTheme.darkContentColor),
            //lowest price list
            Container(
              height: MediaQuery.of(context).size.height *
                  (AppScreenUtil().screenActualWidth() > 370 ? 27 : 30) /
                  100,
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return EveryDayEssentialCard(
                      index: index,
                      data: data[index],);
                },
              ),
            )
          ],
        );
      }
    );
  }
}
