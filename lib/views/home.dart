import 'package:flutter/material.dart';
import 'package:fastkart/config.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Layout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('${[1, 2, 3, 4, 5, 6, 7].sum()}'),
            const Text("Body Area")
                .gestures(
                  onTap: () => Get.toNamed(routeName.changeTheme),
                )
                .elevation(2),
            const VSpace(20),
            ElevatedButton(
              onPressed: () => Get.toNamed(routeName.changeTheme),
              child: const Text("Change Theme"),
            ),
          ],
        ).width(MediaQuery.of(context).size.width).paddingAll(10),
      ),
    );
  }
}
