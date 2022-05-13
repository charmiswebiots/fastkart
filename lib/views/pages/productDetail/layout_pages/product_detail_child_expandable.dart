import 'package:flutter/material.dart';

class ProductDetailChildExpandable extends StatelessWidget {
  final bool? expanded;
  final double? expandedHeight;
  final double? collapsedHeight;
  final Widget? child;
  const ProductDetailChildExpandable({Key? key,this.child,this.collapsedHeight = 0.0,this.expanded,this.expandedHeight = 300.0,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width,
          height: expanded! ? expandedHeight : collapsedHeight,
          child: Container(
            child: child,

          ),
        ),
        if (!expanded!)
          const Divider(
            height: 1,
            indent: 15,
            endIndent: 15,
          )
      ],
    );
  }
}
