
import 'package:fastkart/config.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFormField extends StatelessWidget {
  final String? text;
  final Color? fillcolor;
  final Color? borderColor;
  final Color? hintColor;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool isLargeScreen;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const CommonTextFormField(
      {Key? key,
      this.text,
      this.fillcolor,
      this.borderColor,
      this.hintColor,
        this.obscureText = false,
      this.controller,
      this.suffixIcon,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.isLargeScreen = false,
      this.textInputAction,
      this.prefixIcon,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(14),
            horizontal: AppScreenUtil().size(20)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillcolor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor!)),
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor!,
          ),
        ),
        focusedErrorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: borderColor!)),
        hintText: text,
        hintStyle: TextStyle(
            fontSize: 15,
            color: hintColor,
            fontFamily: GoogleFonts.mulish().fontFamily),
      ),
    );
  }
}
