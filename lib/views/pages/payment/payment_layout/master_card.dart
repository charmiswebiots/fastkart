import '../../../../config.dart';

class MasterCard extends StatelessWidget {
  final dynamic data;
  final Color? titleColor;
  const MasterCard({Key? key,this.data,this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal:
            AppScreenUtil()
                .screenWidth(10),
            vertical: AppScreenUtil()
                .screenHeight(12)),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .center,
          children: [
            Image.asset(
              data['icon']
                  .toString(),
              height: AppScreenUtil()
                  .screenHeight(20),
            ),
            const Space(10, 0),
            PaymentFontStyle().nunitotextLayout(
                text: data['number'],
                fontWeight:
                FontWeight.w700,
                fontSize: PaymentFontSize
                    .textSizeSmall,
                color: titleColor),
          ],
        ));
  }
}
