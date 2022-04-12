import 'package:fastkart/utilities/responsive_layout.dart';
import 'package:fastkart/views/drawer/util/drawer_large_screen.dart';
import 'package:fastkart/views/drawer/util/drawer_small_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      //if screen height is large
      largeScreen: DrawerLargeScreen(),
      //if screen height in medium
      mediumScreen: DrawerSmallScreen(),
    );
  }
}
