import 'package:google_fonts/google_fonts.dart';
import '../../config.dart';

class CommonSearchTextForm extends StatelessWidget {
  final String? text;
  final Color? fillcolor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? titleColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CommonSearchTextForm({Key? key,this.text,this.borderColor,this.suffixIcon,this.hintColor,this.fillcolor,this.prefixIcon,this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenHeight(15),
              right: AppScreenUtil().screenHeight(15)),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() >370 ? 10 :15)),
                  child: Image.asset(
                    iconAssets.voice,
                    fit: BoxFit.contain,
                    color: titleColor,
                    height: AppScreenUtil().screenHeight(10),
                    width: AppScreenUtil().screenWidth(10),
                  ),
                ),
                prefixIcon: Image.asset(
                  iconAssets.textboxSearchIcon,
                  color: titleColor,
                ),
                fillColor: fillcolor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!,
                  ),
                ),
                hintText: text,
                hintStyle: TextStyle(
                    fontSize: AppScreenUtil().fontSize(15),
                    color: hintColor,
                    fontFamily: GoogleFonts.mulish().fontFamily)),
          ),
        );
      }
    );
  }
}
