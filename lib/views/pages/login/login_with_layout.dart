import 'package:dotted_line/dotted_line.dart';
import '../../../config.dart';

class LoginWithLayout extends StatelessWidget {
  final Color? color;
  final Color? fontColor;
  final FontWeight? fontWeight;
  const LoginWithLayout({Key? key,this.fontColor,this.color,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color!,
            lineThickness: 2,
            dashRadius: 2,
          ),
        ),
        const Space(10, 0),
        LoginFontStyle().mulishtextLayout(
          color: fontColor,
          text: LoginFont().signInWith,
          fontWeight: fontWeight!,
          fontSize: LoginFontSize.textSizeSMedium,
        ),
        const Space(10, 0),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color!,
            lineThickness: 2,
            dashRadius: 2,
          ),
        )
      ],
    );
  }
}
