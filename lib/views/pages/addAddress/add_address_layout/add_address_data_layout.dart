import '../../../../config.dart';

class AddAddressDataLayout extends StatelessWidget {
  const AddAddressDataLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BackgroundLayout(icon: iconAssets.truck),
          // Content Layout
          const ContentBgLayout()
        ],
      ),
    );
  }
}
