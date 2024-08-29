import 'package:intl/intl.dart';

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  // String formattedDate = DateFormat('dd MMM, yyyy').format(input);
  String yearFormatDate = DateFormat('dd MMM').format(input);
  if (diff.inDays >= 360) {
    return yearFormatDate;
  } else if (diff.inDays >= 1) {
    // return formattedDate;
    return '${diff.inDays} ${'day ago'}';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} ${'hour ago'}';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} ${'minute ago'}';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} ${'second ago'}';
  } else {
    return 'just now';
  }
}

String convertToInboxTimeAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  // var nowTime = DateTime.now();
  String hourFormat = DateFormat('hh:mm a').format(input);
  // String hourFormat = DateFormat('dd MMM, yyyy').format(input);
  String fullFormat = DateFormat('dd/MM/yyyy').format(input);
  // if (diff.inDays >= 360) {
  //   return yearFormatDate;
  // } else
  if (diff.inDays == 1) {
    /// It's yesterday's message.

    return 'Yesterday';
  } else if (diff.inDays == 0) {
    /// Today messages.
    return hourFormat;
  } else {
    ///for rest of all show full date

    return fullFormat;
  }
  //   else if (diff.inHours >= 1) {
  //   return '${diff.inHours} ${'hour ago'}';
  // } else if (diff.inMinutes >= 1) {
  //   return '${diff.inMinutes} ${'min ago'}';
  // } else if (diff.inSeconds >= 1) {
  //   return '${diff.inSeconds} ${'second ago'}';
  // } else {
  //   return 'just now';
  // }
}

// String convertToInboxChatTime(DateTime input) {
//   Duration diff = DateTime.now().difference(input);
//   // var nowTime = DateTime.now();
//   String hourFormat = DateFormat('hh:mm a').format(input);
//   // String hourFormat = DateFormat('dd MMM, yyyy').format(input);
//   String fullFormat = DateFormat('dd/MM/yyyy').format(input);
//
//   return hourFormat;
// }
