import 'package:flutter/material.dart';
import 'package:fastkart/common/theme/app_css.dart';
import 'package:fastkart/controllers/common/app_controller.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final TextEditingController? controller;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final bool showCounter;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool showBoarder;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.hint,
    this.hintText,
    this.labelText,
    this.errorText,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.fillColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.maxLength,
    this.showCounter = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.showBoarder = true,
    this.textAlignVertical = TextAlignVertical.center,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: const BorderSide(style: BorderStyle.none),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        border: Border.all(
          color: appCtrl.appTheme.borderGray,
          width: 1,
          style: showBoarder ? BorderStyle.solid : BorderStyle.none,
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: prefixIcon,
            ),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: style ?? AppCss.body1,
              obscureText: obscureText,
              validator: validator,
              keyboardType: keyboardType ?? TextInputType.text,
              maxLines: maxLines,
              minLines: minLines,
              enabled: enabled,
              maxLength: maxLength,
              onTap: onTap,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              textAlign: TextAlign.justify,
              textAlignVertical: textAlignVertical,
              focusNode: focusNode,
              decoration: InputDecoration(
                enabledBorder: inputBorder,
                disabledBorder: inputBorder,
                border: inputBorder,
                focusedBorder: inputBorder,
                errorBorder: inputBorder,
                focusedErrorBorder: inputBorder,
                filled: true,
                fillColor: fillColor ?? appCtrl.appTheme.whiteColor,
                contentPadding: padding,
                hintText: hintText,
                labelText: labelText,
                errorText: errorText,
                errorMaxLines: 2,
                counterText: showCounter ? null : '',
              ),
            ),
          ),
          if (suffixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: suffixIcon,
            ),
        ],
      ),
    );
  }
}
