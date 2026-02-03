import 'package:intl/intl.dart';

class DateFormatter {

  static String formatUiDate(DateTime date) {
    return DateFormat('MMM d, y').format(date);
  }

  static String formatExpiry(DateTime date) {
    return DateFormat('MM/yy').format(date);
  }

  static String formatApiDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}