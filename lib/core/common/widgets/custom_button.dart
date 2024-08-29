import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final String buttonLabel;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? width, height, elevation;
  final EdgeInsetsGeometry? padding, margin;
  final ButtonStyle? buttonStyle;
  final Widget? iconWidget;
  final BorderSide? borderSide;
  final bool? isFlexible;

  const CustomButton({
    super.key,
    this.child,
    required this.buttonLabel,
    required this.onPressed,
    this.iconWidget,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
    this.elevation,
    this.margin,
    this.buttonStyle,
    this.borderSide,
    this.isFlexible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      // width: width ?? kWidth * 0.95,
      margin: margin,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              elevation: elevation ?? 5,
              textStyle: customButtonPoppinsTextStyle,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              backgroundColor: backgroundColor ?? AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: borderSide ?? const BorderSide(color: Colors.transparent),
              ),
            ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: isFlexible! ? MainAxisSize.min : MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: iconWidget ?? const SizedBox.shrink(),
                ),
                Text(
                  buttonLabel,
                  style: customButtonPoppinsTextStyle,
                ),
              ],
            ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final Widget? customChild;
  final String buttonLabel;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? width, height, elevation;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? iconWidget;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final bool? isFlexible;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton2({
    super.key,
    this.customChild,
    required this.buttonLabel,
    required this.onPressed,
    this.iconWidget,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
    this.elevation,
    this.margin,
    this.textStyle,
    this.borderSide,
    this.isFlexible = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 50,
// width: width ?? kWidth * 0.95,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          color: backgroundColor ?? AppColors.buttonColor,
          border: Border.all(
            color: Colors.transparent,
          ),
        ),

        child: customChild ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: isFlexible! ? MainAxisSize.min : MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: iconWidget ?? const SizedBox.shrink(),
                ),
                Text(
                  buttonLabel,
                  style: textStyle ?? customButtonPoppinsTextStyle,
                ),
              ],
            ),
      ),
    );
  }
}
