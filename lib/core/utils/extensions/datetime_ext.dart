import 'package:intl/intl.dart';

extension NullableDateTimeExtension on DateTime? {
  String toCustomFormatString() {
    if (this == null) return "";
    return DateFormat("MMM-yyyy-dd").format(this!);
  }

  String toCustomPostFormat() {
    if (this == null) return "";
    try {
      String formattedDate = DateFormat('dd-mm-yy hh:mm a').format(this!);
      return formattedDate;
    } catch (e) {
      return "-";
    }
  }
}
