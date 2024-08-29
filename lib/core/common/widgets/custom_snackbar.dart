import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/constants/app_images.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter_clean_todo/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void successSnackBar({required String message, int seconds = 4, int maxLines = 3}) {
    Get.showSnackbar(
      GetSnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: const EdgeInsets.all(0),
        backgroundColor: AppColors.secondaryColor,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: seconds),
        boxShadows: [
          BoxShadow(offset: const Offset(0, 8), color: Colors.black.withOpacity(0.2), blurRadius: 10, spreadRadius: 0),
          BoxShadow(offset: const Offset(0, 6), color: Colors.black.withOpacity(0.12), blurRadius: 30, spreadRadius: 0),
          BoxShadow(offset: const Offset(0, 16), color: Colors.black.withOpacity(0.14), blurRadius: 24, spreadRadius: 0),
        ],
        // messageText: Stack(
        //   children: [
        //     SvgPicture.asset(AppImages.greenRadialGradient),
        //     Positioned(
        //       top: 10,
        //       left: 10,
        //       bottom: 10,
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           SvgPicture.asset(AppImages.successIcon),
        //           SizedBox(
        //             width:  0.6.kWidth(context) ,
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 10.0, right: 20),
        //               child: Text(
        //                 message,
        //                 textAlign: TextAlign.start,
        //                 maxLines: 3,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: poppinsTextStyle.copyWith(fontSize: 12, color: AppColors.appWhiteColor),
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               // Dismiss the Snackbar when the close icon is tapped
        //               Get.closeCurrentSnackbar();
        //             },
        //             child: const Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        //               child: Icon(
        //                 Icons.close_rounded,
        //                 size: 20,
        //                 color: AppColors.appWhiteColor,
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        messageText: _SnackBarWidget(
          message: message,
          maxLines: maxLines,
          isSuccess: true,
        ),
        borderRadius: 8,
      ),
    );

    // ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
    //   SnackBar(
    //     backgroundColor: AppColors.secondaryColor,
    //     content: Container(
    //       // width: kWidth * 0.9,
    //       child: Stack(
    //         children: [
    //           SvgPicture.asset(AppImages.greenRadialGradient),
    //           Positioned(
    //             top: 10,
    //             left: 10,
    //             bottom: 10,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 SvgPicture.asset(AppImages.successIcon),
    //                 SizedBox(
    //                   width: kWidth * 0.6,
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(left: 10.0),
    //                     child: Text(
    //                       message,
    //                       textAlign: TextAlign.start,
    //                       maxLines: 3,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: poppinsTextStyle.copyWith(fontSize: 12, color: AppColors.appWhiteColor),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     margin: EdgeInsets.only(
    //       left: 20,
    //       right: 20,
    //       bottom: kHeight * 0.8,
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //     padding: EdgeInsets.all(0),
    //     duration: Duration(seconds: seconds),
    //     showCloseIcon: true,
    //     closeIconColor: AppColors.appWhiteColor,
    //   ),
    // );
  }

  static void errorSnackBar({required String message, int seconds = 4, int maxLines = 3}) {
    Get.showSnackbar(
      GetSnackBar(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: const EdgeInsets.all(0),
        backgroundColor: AppColors.secondaryColor,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: seconds),
        boxShadows: [
          BoxShadow(offset: const Offset(0, 8), color: Colors.black.withOpacity(0.2), blurRadius: 10, spreadRadius: 0),
          BoxShadow(offset: const Offset(0, 6), color: Colors.black.withOpacity(0.12), blurRadius: 30, spreadRadius: 0),
          BoxShadow(offset: const Offset(0, 16), color: Colors.black.withOpacity(0.14), blurRadius: 24, spreadRadius: 0),
        ],
        messageText: _SnackBarWidget(
          message: message,
          maxLines: maxLines,
          isSuccess: false,
        ),
        borderRadius: 8,
      ),
    );

    // ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
    //   SnackBar(
    //     backgroundColor: AppColors.secondaryColor,
    //     content: Container(
    //       // width: kWidth * 0.9,
    //       child: Stack(
    //         children: [
    //           SvgPicture.asset(AppImages.redRadialGradient),
    //           Positioned(
    //             top: 10,
    //             left: 10,
    //             bottom: 10,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 SvgPicture.asset(AppImages.notSuccessIcon),
    //                 SizedBox(
    //                   width: kWidth * 0.6,
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(left: 10.0),
    //                     child: Text(
    //                       message,
    //                       textAlign: TextAlign.start,
    //                       maxLines: 3,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: poppinsTextStyle.copyWith(color: AppColors.appWhiteColor, fontSize: 12),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     margin: EdgeInsets.only(
    //       left: 20,
    //       right: 20,
    //       bottom: kHeight * 0.8,
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //     padding: EdgeInsets.all(0),
    //     duration: Duration(seconds: seconds),
    //     showCloseIcon: true,
    //     closeIconColor: AppColors.appWhiteColor,
    //   ),
    // );
  }
}

class _SnackBarWidget extends StatelessWidget {
  final String message;
  final int maxLines;
  final bool isSuccess;

  const _SnackBarWidget({required this.message, required this.maxLines, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SvgPicture.asset(isSuccess ? AppImages.greenRadialGradient : AppImages.redRadialGradient),
        Positioned(
          top: 10,
          left: 10,
          bottom: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(isSuccess ? AppImages.successIcon : AppImages.errorCrossMarkIcon),
              SizedBox(
                width: 0.6.kWidth(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20),
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: poppinsTextStyle.copyWith(fontSize: 12, color: AppColors.appWhiteColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Dismiss the Snackbar when the close icon is tapped
                  //TODO : - Close Current Snackbar impl
                  Get.closeCurrentSnackbar();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: AppColors.appWhiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
