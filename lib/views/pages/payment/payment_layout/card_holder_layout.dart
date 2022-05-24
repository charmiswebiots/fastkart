import '../../../../config.dart';

class CardHolderLayout extends StatelessWidget {
  final TextEditingController? txtExpiryDate;
  final TextEditingController? txtCV;
  const CardHolderLayout({Key? key,this.txtCV,this.txtExpiryDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            Expanded(
              child: CommonTextFormField(
                controller: txtExpiryDate,
                suffixIcon: const Icon(
                  Icons.calendar_today,
                ),
                text: PaymentFont().expiryDate,
                borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                hintColor: appCtrl.appTheme.contentColor,
                fillcolor: appCtrl.appTheme.textBoxColor,
              ),
            ),
            const Space(10, 0),
            Expanded(
              child: CommonTextFormField(
                controller: txtCV,
                text: PaymentFont().cv,
                borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                hintColor: appCtrl.appTheme.contentColor,
                fillcolor: appCtrl.appTheme.textBoxColor,
              ),
            ),
          ],
        );
      }
    );
  }
}
