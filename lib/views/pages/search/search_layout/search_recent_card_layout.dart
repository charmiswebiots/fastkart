import '../../../../config.dart';

class SearchRecentCard extends StatelessWidget {
  final Color? color;
  final dynamic data ;
  const SearchRecentCard({Key? key,this.data,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppScreenUtil().screenHeight(30),
      margin: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(25),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(5))),
      child: SearchFontStyle().mulishtextLayout(
          text: data['title'],
          textAlign: TextAlign.center,
          fontSize: 12),
    );
  }
}
