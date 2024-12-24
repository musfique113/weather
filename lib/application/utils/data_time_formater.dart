import 'package:intl/intl.dart';

class DateTimeFormater {
  static String formatDateTime(int timestamp) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return DateFormat('h a').format(dateTime);
  }
}
