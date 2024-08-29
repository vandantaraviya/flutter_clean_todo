import 'package:flutter_clean_todo/core/common/text_styles/text_styles.dart';
import 'package:flutter_clean_todo/core/theme/app_colors.dart';
import 'package:flutter_clean_todo/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetWithTitle {
  Future<T?> show<T>({
    String? title = "",
    bool isTitleCenter = true,
    Widget? child,
    double? height,
    Widget? custom,
    bool? isScrollable = false,
  }) async {
    return Get.bottomSheet(
      Container(
        width: double.infinity,
        height: height ?? 320,
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: custom ??
            SingleChildScrollView(
              physics: isScrollable! ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
                    child: Center(
                      child: SizedBox(
                        width: 55,
                        child: Divider(
                          thickness: 3,
                          color: AppColors.greyDividerColor,
                        ),
                      ),
                    ),
                  ),
                  if (title != "" || title!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: isTitleCenter
                          ? Center(
                              child: Text(
                                title ?? "",
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Text(
                              title ?? "",
                              style: poppinsTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  if (title != "" || title!.isNotEmpty)
                    const Divider(
                      height: 2,
                      color: AppColors.greyDividerColor,
                    ),
                  child ?? const SizedBox.shrink(),
                ],
              ),
            ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}

// class CustomMaterialModalBottomSheet {
//   show({
//     String? title = "",
//     bool isTitleCenter = true,
//     bool isScrollControlled = true,
//     bool? isScrollable = false,
//     Widget? child,
//     double? height,
//     Widget? custom,
//     required BuildContext context,
//   }) async {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: isScrollControlled,
//       enableDrag: true,
//       isDismissible: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       builder: (context) => Container(
//         width: double.infinity,
//         height: height ?? kHeight * 0.8,
//         padding: const EdgeInsets.only(top: 8),
//         decoration: const BoxDecoration(
//           color: AppColors.secondaryColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//         ),
//         child: custom ??
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
//                   child: Center(
//                     child: SizedBox(
//                       width: 55,
//                       child: Divider(
//                         thickness: 3,
//                         color: AppColors.greyDividerColor,
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (title != "" || title!.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: isTitleCenter
//                         ? Center(
//                             child: Text(
//                               title ?? "",
//                               style: poppinsTextStyle.copyWith(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           )
//                         : Text(
//                             title ?? "",
//                             style: poppinsTextStyle.copyWith(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 if (title != "" || title!.isNotEmpty)
//                   Divider(
//                     height: 2,
//                     color: AppColors.greyDividerColor,
//                   ),
//                 SingleChildScrollView(
//                   physics: isScrollable! ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
//                   child: child ?? SizedBox.shrink(),
//                 ),
//               ],
//             ),
//       ),
//     );
//
//     // Get.bottomSheet(
//     //     Container(
//     //         width: double.infinity,
//     //         height: height ?? 320,
//     //         padding: const EdgeInsets.only(top: 8),
//     //         decoration: const BoxDecoration(
//     //           color: AppColors.secondaryColor,
//     //           borderRadius: BorderRadius.only(
//     //             topLeft: Radius.circular(40),
//     //             topRight: Radius.circular(40),
//     //           ),
//     //         ),
//     //         child: custom ??
//     //             Column(
//     //               mainAxisAlignment: MainAxisAlignment.start,
//     //               crossAxisAlignment: CrossAxisAlignment.start,
//     //               children: [
//     //                 Padding(
//     //                   padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
//     //                   child: Center(
//     //                     child: SizedBox(
//     //                       width: 55,
//     //                       child: Divider(
//     //                         thickness: 3,
//     //                         color: AppColors.greyDividerColor,
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 if (title != "" || title!.isNotEmpty)
//     //                   Padding(
//     //                     padding: const EdgeInsets.all(10),
//     //                     child: isTitleCenter
//     //                         ? Center(
//     //                       child: Text(
//     //                         title ?? "",
//     //                         style: poppinsTextStyle.copyWith(
//     //                           fontSize: 20,
//     //                           fontWeight: FontWeight.w600,
//     //                         ),
//     //                       ),
//     //                     )
//     //                         : Text(
//     //                       title ?? "",
//     //                       style: poppinsTextStyle.copyWith(
//     //                         fontSize: 20,
//     //                         fontWeight: FontWeight.w600,
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 if (title != "" || title!.isNotEmpty)
//     //                   Divider(
//     //                     height: 2,
//     //                     color: AppColors.greyDividerColor,
//     //                   ),
//     //                 child ?? SizedBox.shrink(),
//     //               ],
//     //             )),
//     //   isDismissible: true,
//     //   isScrollControlled: true,
//     //
//     //   shape: const RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.only(
//     //       topLeft: Radius.circular(40),
//     //       topRight: Radius.circular(40),
//     //     ),
//     //   ),
//     // );
//     // showFlexibleBottomSheet(
//     //   context: Get.context!,
//     //   isExpand: false,
//     //   initHeight: 1,
//     //   maxHeight: 1,
//     //   isCollapsible: true,
//     //   isDismissible: true,
//     //   isModal: true,
//     //   bottomSheetBorderRadius: const BorderRadius.only(
//     //     topLeft: Radius.circular(40),
//     //     topRight: Radius.circular(40),
//     //   ),
//     //   builder: (context, scrollController, bottomSheetOffset) => Container(
//     //       width: double.infinity,
//     //       height: height ?? 320,
//     //       padding: const EdgeInsets.only(top: 8),
//     //       decoration: const BoxDecoration(
//     //         color: AppColors.secondaryColor,
//     //         borderRadius: BorderRadius.only(
//     //           topLeft: Radius.circular(40),
//     //           topRight: Radius.circular(40),
//     //         ),
//     //       ),
//     //       child: custom ??
//     //           Column(
//     //             mainAxisAlignment: MainAxisAlignment.start,
//     //             crossAxisAlignment: CrossAxisAlignment.start,
//     //             children: [
//     //               Padding(
//     //                 padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
//     //                 child: Center(
//     //                   child: SizedBox(
//     //                     width: 55,
//     //                     child: Divider(
//     //                       thickness: 3,
//     //                       color: AppColors.greyDividerColor,
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ),
//     //               if (title != "" || title!.isNotEmpty)
//     //                 Padding(
//     //                   padding: const EdgeInsets.all(10),
//     //                   child: isTitleCenter
//     //                       ? Center(
//     //                           child: Text(
//     //                             title ?? "",
//     //                             style: poppinsTextStyle.copyWith(
//     //                               fontSize: 20,
//     //                               fontWeight: FontWeight.w600,
//     //                             ),
//     //                           ),
//     //                         )
//     //                       : Text(
//     //                           title ?? "",
//     //                           style: poppinsTextStyle.copyWith(
//     //                             fontSize: 20,
//     //                             fontWeight: FontWeight.w600,
//     //                           ),
//     //                         ),
//     //                 ),
//     //               if (title != "" || title!.isNotEmpty)
//     //                 Divider(
//     //                   height: 2,
//     //                   color: AppColors.greyDividerColor,
//     //                 ),
//     //               child ?? SizedBox.shrink(),
//     //             ],
//     //           )),
//     // );
//   }
// }

class CustomMaterialModalBottomSheet {
  show({
    String? title = "",
    bool isTitleCenter = true,
    bool isScrollControlled = true,
    bool? isScrollable = false,
    Widget? child,
    double? height,
    Widget? custom,
    // required BuildContext context,
  }) async {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        builder: (context) => Container(
          width: double.infinity,
          height: height ?? 0.8.kHeight(context),
          padding: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: custom ??
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
                    child: Center(
                      child: SizedBox(
                        width: 55,
                        child: Divider(
                          thickness: 3,
                          color: AppColors.greyDividerColor,
                        ),
                      ),
                    ),
                  ),
                  if (title != "" || title!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: isTitleCenter
                          ? Center(
                              child: Text(
                                title ?? "",
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Text(
                              title ?? "",
                              style: poppinsTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  if (title != "" || title!.isNotEmpty)
                    const Divider(
                      height: 2,
                      color: AppColors.greyDividerColor,
                    ),
                  SingleChildScrollView(
                    physics: isScrollable! ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
                    child: child ?? const SizedBox.shrink(),
                  ),
                ],
              ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: isScrollControlled,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );

    ///Using ModalBottomSheet

    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: isScrollControlled,
    //   enableDrag: true,
    //   isDismissible: true,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(40),
    //       topRight: Radius.circular(40),
    //     ),
    //   ),
    //   builder: (context) => Container(
    //     width: double.infinity,
    //     height: height ?? kHeight * 0.8,
    //     padding: const EdgeInsets.only(top: 8),
    //     decoration: const BoxDecoration(
    //       color: AppColors.secondaryColor,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(40),
    //         topRight: Radius.circular(40),
    //       ),
    //     ),
    //     child: custom ??
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Padding(
    //               padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
    //               child: Center(
    //                 child: SizedBox(
    //                   width: 55,
    //                   child: Divider(
    //                     thickness: 3,
    //                     color: AppColors.greyDividerColor,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             if (title != "" || title!.isNotEmpty)
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: isTitleCenter
    //                     ? Center(
    //                   child: Text(
    //                     title ?? "",
    //                     style: poppinsTextStyle.copyWith(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                   ),
    //                 )
    //                     : Text(
    //                   title ?? "",
    //                   style: poppinsTextStyle.copyWith(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                 ),
    //               ),
    //             if (title != "" || title!.isNotEmpty)
    //               Divider(
    //                 height: 2,
    //                 color: AppColors.greyDividerColor,
    //               ),
    //             SingleChildScrollView(
    //               physics: isScrollable! ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
    //               child: child ?? SizedBox.shrink(),
    //             ),
    //           ],
    //         ),
    //   ),
    // );
  }
}
