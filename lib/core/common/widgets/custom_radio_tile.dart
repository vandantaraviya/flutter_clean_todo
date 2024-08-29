import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final String title;
  final T radioValue;
  final T currentRadioValue;
  final void Function(T?)? onChanged;
  final Color? fillColor;
  final EdgeInsetsGeometry? margin, padding;
  const CustomRadioTile({
    required this.title,
    required this.radioValue,
    required this.currentRadioValue,
    required this.onChanged,
    this.fillColor,
    this.margin,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 5),
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: poppinsTextStyle.copyWith(
                fontSize: 16,
                fontWeight: radioValue == currentRadioValue ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          Radio<T>(
            value: radioValue,
            groupValue: currentRadioValue,
            onChanged: onChanged,
            fillColor: WidgetStatePropertyAll<Color>(fillColor ?? AppColors.appWhiteColor),
          ),
        ],
      ),
    );
  }
}

class CustomRadioPlanTile<T> extends StatelessWidget {
  final String title;
  final T radioValue;
  final T currentRadioValue;
  final void Function(T?)? onChanged;
  final Color? fillColor;
  final EdgeInsetsGeometry? margin, padding;
  final bool? isPopular;
  const CustomRadioPlanTile({
    required this.title,
    required this.radioValue,
    required this.currentRadioValue,
    required this.onChanged,
    this.fillColor,
    this.margin,
    this.padding,
    this.isPopular = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 5),
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Text(
                    title,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: radioValue == currentRadioValue ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (isPopular!)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: const Text("Popular"),
                  ),
              ],
            ),
          ),
          Radio<T>(
            value: radioValue,
            groupValue: currentRadioValue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: onChanged,
            fillColor: WidgetStatePropertyAll<Color>(fillColor ?? AppColors.appWhiteColor),
          ),
        ],
      ),
    );
  }
}
