import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../text_styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final InputBorder? focusedBorder, enabledBorder, errorBorder;
  final InputDecoration? decoration;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final Color? fillColor, cursorColor;
  final bool? filled, obscureText;
  final TextStyle? textStyle, hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final BorderRadius? borderRadiusAll;

  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.controller,
    this.focusNode,
    this.onTapOutside,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.decoration,
    this.fillColor,
    this.filled,
    this.cursorColor,
    this.textStyle,
    this.hintStyle,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.autoValidateMode,
    this.maxLines,
    this.textInputAction,
    this.borderRadiusAll,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: cursorColor ?? AppColors.appWhiteColor,
      style: textStyle ?? textFieldStyleInter,
      keyboardType: keyboardType,
      autovalidateMode: autoValidateMode,
      textInputAction: textInputAction,

      obscureText: obscureText ?? false,
      maxLines: maxLines ?? (obscureText ?? false ? 1 : null), // Allow unlimited number of lines for multiline input
      decoration: decoration ??
          InputDecoration(
            // contentPadding: EdgeInsets.all(8.0),

            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(12)),
                  borderSide: const BorderSide(color: AppColors.greyColor),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(12)),
                  borderSide: const BorderSide(color: AppColors.primaryColor2),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(12)),
                  borderSide: const BorderSide(color: AppColors.errorColor),
                ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(12)),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(12)),
              borderSide: const BorderSide(color: AppColors.primaryColor2),
            ),
            errorMaxLines: 2,

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            errorStyle: poppinsTextStyle.copyWith(fontSize: 10, color: AppColors.errorColor),
            hintText: hintText,
            hintStyle: hintStyle ?? poppinsTextStyle.copyWith(fontSize: 12, color: AppColors.greyColor),
            fillColor: fillColor ?? AppColors.secondaryColor,
            filled: filled ?? true,
          ),
    );
  }
}
