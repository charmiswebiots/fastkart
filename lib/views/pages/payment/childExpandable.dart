import 'package:flutter/material.dart';

class ChildExpandable extends StatelessWidget {
  bool? expanded;
  double? expandedHeight = 300.0;
  double? collapsedHeight = 0.0;
  Widget? child;
  ChildExpandable({Key? key,this.child,this.collapsedHeight,this.expanded,this.expandedHeight,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width:  MediaQuery.of(context).size.width,
          height: expanded! ? expandedHeight : collapsedHeight,
          child: Container(
            child: child,
          ),
        ),
        if (!expanded!)
          Divider(
            height: 1,
            indent: 15,
            endIndent: 15,
          )
      ],
    );
  }
}
