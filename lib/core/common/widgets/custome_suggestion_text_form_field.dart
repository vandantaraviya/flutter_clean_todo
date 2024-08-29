// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:flutter/material.dart';
//
// import '../../theme/app_colors.dart';
// import '../text_styles/text_styles.dart';
//
// class CustomSuggestionTextFormField extends StatelessWidget {
//   final InputBorder? focusedBorder, enabledBorder, errorBorder;
//   final InputDecoration? decoration;
//   final Widget? prefixIcon, suffixIcon;
//   final String? hintText;
//   final Color? fillColor, cursorColor;
//   final bool? filled, obscureText;
//   final TextStyle? textStyle, hintStyle;
//   final TextEditingController controller;
//   final FocusNode? focusNode;
//   final Function(PointerDownEvent)? onTapOutside;
//   final Function(String)? onChanged;
//   String? Function(String?)? validator;
//   Function(String?)? onSaved;
//   Function(String)? onFieldSubmitted;
//   final AutovalidateMode? autoValidateMode;
//   List<String> suggestion_list;
//   GlobalKey<AutoCompleteTextFieldState<String>> autocomplete_key = GlobalKey();
//   CustomSuggestionTextFormField(
//       {Key? key,
//       this.hintText,
//       required this.controller,
//       this.focusNode,
//       this.onTapOutside,
//       this.onChanged,
//       this.prefixIcon,
//       this.suffixIcon,
//       this.focusedBorder,
//       this.enabledBorder,
//       this.errorBorder,
//       this.decoration,
//       this.fillColor,
//       this.filled,
//       this.cursorColor,
//       this.textStyle,
//       this.hintStyle,
//       this.obscureText,
//       this.validator,
//       this.onSaved,
//       this.onFieldSubmitted,
//       this.autoValidateMode,
//       required this.autocomplete_key,
//       required this.suggestion_list})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleAutoCompleteTextField(
//       key: autocomplete_key,
//       controller: controller,
//       focusNode: focusNode,
//       textChanged: onChanged,
//       clearOnSubmit: false,
//       textSubmitted: onFieldSubmitted,
//       cursorColor: cursorColor ?? AppColors.appWhiteColor,
//       style: textStyle ?? textFieldStyleInter,
//       keyboardType: TextInputType.text,
//       textInputAction: TextInputAction.search,
//       decoration: decoration ??
//           InputDecoration(
//             // contentPadding: EdgeInsets.all(8.0),
//
//             contentPadding: EdgeInsets.symmetric(horizontal: 8),
//             enabledBorder: enabledBorder ??
//                 OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   borderSide: BorderSide(color: AppColors.greyColor),
//                 ),
//             focusedBorder: focusedBorder ??
//                 OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   borderSide: BorderSide(color: AppColors.greyColor),
//                 ),
//             errorBorder: errorBorder ??
//                 OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   borderSide: BorderSide(color: AppColors.errorColor),
//                 ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               borderSide: BorderSide(color: AppColors.errorColor),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               borderSide: BorderSide(color: AppColors.greyColor),
//             ),
//             errorMaxLines: 2,
//
//             prefixIcon: prefixIcon,
//             suffixIcon: suffixIcon,
//
//             errorStyle: poppinsTextStyle.copyWith(
//                 fontSize: 10, color: AppColors.errorColor),
//             hintText: hintText,
//             hintStyle: hintStyle ??
//                 poppinsTextStyle.copyWith(
//                     fontSize: 12, color: AppColors.greyColor),
//             fillColor: fillColor ?? AppColors.secondaryColor,
//             filled: filled ?? true,
//           ),
//       suggestions: suggestion_list,
//     );
//   }
// }
