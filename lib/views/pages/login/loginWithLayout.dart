import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class LoginWithLayout extends StatelessWidget {
  var color;
  var fontColor;
  var fontWeight;
  LoginWithLayout({Key? key,this.fontColor,this.color,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        ),
        Space(10, 0),
        LoginFontStyle().mulishtextLayout(
          color: fontColor,
          text: LoginFont().signInWith,
          fontWeight: fontWeight,
          fontSize: LoginFontSize.textSizeSMedium,
        ),
        Space(10, 0),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        )
      ],
    );
  }
}
