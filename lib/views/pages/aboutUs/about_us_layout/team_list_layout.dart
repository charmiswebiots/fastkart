
import '../../../../config.dart';

class TeamListLayout extends StatelessWidget {
  const TeamListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (aboutUsCtrl) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: AppArray().teamList.length,
          itemBuilder: (context, index) {
            return TeamListCard(
              data: AppArray().teamList[index],
              lightPrimaryColor: aboutUsCtrl.appCtrl.appTheme.lightPrimary,
              titleColor: aboutUsCtrl.appCtrl.appTheme.titleColor,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.6)),
        );
      }
    );
  }
}
