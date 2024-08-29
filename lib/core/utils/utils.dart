import 'package:flutter_clean_todo/core/common/enums/enums.dart';
import 'package:flutter_clean_todo/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

extension KHeight on num {
  double kHeight(BuildContext context) {
    assert(this >= 0.0 && this <= 1.0, 'The value must be between 0.0 and 1.0');

    return MediaQuery.sizeOf(context).height * this;
  }

  double kWidth(BuildContext context) {
    assert(this >= 0.0 && this <= 1.0, 'The value must be between 0.0 and 1.0');

    return MediaQuery.sizeOf(context).width * this;
  }

  // double kHeightRatio = kHeight / 932; // According to design in iPhone 15 Pro Max
// double kWidthRatio = kWidth / 430;

  double kHeightRatio(BuildContext context) {
    return (MediaQuery.sizeOf(context).height / 932);
  }

  double kWidthRatio(BuildContext context) {
    return (MediaQuery.sizeOf(context).width / 430);
  }

  double kShortestSide(BuildContext context) {
    return MediaQuery.sizeOf(context).shortestSide;
  }
}

// double kShortestSide = Get.mediaQuery.size.shortestSide;
//
// bool kIsSmallestWidth = (Get.mediaQuery.size.shortestSide <= 380 && Get.mediaQuery.size.shortestSide >= 340) ? true : false;
// bool kIsMediumWidth = (Get.mediaQuery.size.shortestSide <= 410 && Get.mediaQuery.size.shortestSide >= 381) ? true : false;
// bool kIsIPad = kShortestSide >= 600;
//
// double kHeightRatio = kHeight / 932; // According to design in iPhone 15 Pro Max
// double kWidthRatio = kWidth / 430;

// String postCacheKey({required String id}) {
//   return "post_$id".toLowerCase();
// }

// void loading({required bool show, String title = "Loading.."}) {
//   if (show) {
//     EasyLoading.instance
//       ..indicatorType = EasyLoadingIndicatorType.ring
//       ..maskColor = AppColors.secondaryColor.withOpacity(.2)
//
//       /// custom style
//       ..loadingStyle = EasyLoadingStyle.custom
//       ..progressColor = AppColors.secondaryColor
//       ..indicatorColor = AppColors.secondaryColor
//       ..backgroundColor = AppColors.appWhiteColor
//       ..textColor = Colors.black
//
//       ///
//       ..userInteractions = false
//       ..animationStyle = EasyLoadingAnimationStyle.offset
//       ..dismissOnTap = kDebugMode;
//     EasyLoading.show(
//       maskType: EasyLoadingMaskType.custom,
//       status: title,
//     );
//   } else {
//     EasyLoading.dismiss();
//   }
// }
//
// void progressLoading({required bool show, double progress = 0.0, String title = "Progress.."}) {
//   assert(
//     progress >= 0.0 && progress <= 1.0,
//     'progress value should be 0.0 ~ 1.0',
//   );
//
//   if (show) {
//     EasyLoading.instance
//       ..indicatorType = EasyLoadingIndicatorType.ring
//       ..maskColor = AppColors.secondaryColor.withOpacity(.2)
//
//       /// custom style
//       ..loadingStyle = EasyLoadingStyle.custom
//       ..progressColor = AppColors.secondaryColor
//       ..indicatorColor = AppColors.secondaryColor
//       ..backgroundColor = AppColors.appWhiteColor
//       ..textColor = Colors.black
//
//       ///
//       ..userInteractions = false
//       ..animationStyle = EasyLoadingAnimationStyle.offset
//       ..dismissOnTap = kDebugMode;
//     EasyLoading.showProgress(
//       progress,
//       status: title,
//       maskType: EasyLoadingMaskType.custom,
//     );
//   } else {
//     EasyLoading.dismiss();
//   }
// }

Widget errorInfoIcon() {
  return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        AppImages.errorInfo,
        fit: BoxFit.contain,
        width: 16,
        height: 16,
      ));
}

String convertDateTimeToMinutesAndHours(String datetimeString) {
  DateTime dateTime = DateTime.parse(datetimeString);
  int minutes = dateTime.minute;
  int hours = dateTime.hour;

  String result;

  // Conditionally format based on the number of minutes and hours
  if (hours > 0) {
    result = '$hours hours';
  } else if (minutes > 0) {
    result = '$minutes minutes';
  } else {
    result = '';
  }

  return result;
}

double convertInByte(int size, String type) {
  double result;

  switch (type.toLowerCase()) {
    case "tb":
      result = (size * 1024 * 1024 * 1024 * 1024).toDouble();
      break;
    case "gb":
      result = (size * 1024 * 1024 * 1024).toDouble();
      break;
    case "mb":
      result = (size * 1024 * 1024).toDouble();
      break;
    case "kb":
      result = (size * 1024).toDouble();
      break;
    default:
      return size.toDouble();
  }

  return result;
}

UserLikeStatus userLikeStatusParserFromInt({required int intValue}) {
  UserLikeStatus value = UserLikeStatus.none;
  switch (intValue) {
    case 0:
      value = UserLikeStatus.none;
      break;
    case 1:
      value = UserLikeStatus.like;
      break;
    case 2:
      value = UserLikeStatus.emptyLike;
      break;
    case 3:
      value = UserLikeStatus.dislike;
      break;
    case 4:
      value = UserLikeStatus.emptyDislike;
      break;
    default:
      return value;
  }

  return value;
}

void vibrateOnTap() {
  HapticFeedback.vibrate();
}
