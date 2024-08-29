import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height, width;
  final Widget? leadingWidget, middleWidget, trailingWidget;
  final bool isLeadingWidget, isMiddleWidget, isTrailingWidget;
  final Color? backgroundColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin, padding;
  const CustomAppBar({
    super.key,
    required this.isLeadingWidget,
    required this.isMiddleWidget,
    required this.isTrailingWidget,
    this.height,
    this.width,
    this.leadingWidget,
    this.middleWidget,
    this.trailingWidget,
    this.backgroundColor,
    this.decoration,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      margin: margin,
      padding: padding ??
          const EdgeInsets.only(
            top: 5,
            left: 5,
            right: 10,
          ),
      decoration: decoration ?? BoxDecoration(color: backgroundColor ?? Colors.green),
      // color: Colors.amber,
      width: width ?? Get.mediaQuery.size.width,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLeadingWidget)
              // Expanded( flex : 1,child:
              leadingWidget!,
            // ),
            // const Spacer(),
            if (isMiddleWidget)
              // Expanded( flex : 3,child:
              middleWidget!,
            // ),
            // const Spacer(),
            if (isTrailingWidget)
              // Expanded(flex: 1, child:
              trailingWidget!,

            // ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
