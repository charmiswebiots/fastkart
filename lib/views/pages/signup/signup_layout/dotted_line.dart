import 'package:dotted_line/dotted_line.dart';

import '../../../../config.dart';

class DottedLineLayout extends StatelessWidget {
  final color;

  const DottedLineLayout({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DottedLine(
        direction: Axis.horizontal,
        dashLength: 5,
        dashColor: color,
        lineThickness: 2,
        dashRadius: 2,
      ),
    );
  }
}
