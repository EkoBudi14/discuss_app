import 'package:intl/intl.dart';

class AppFormat {
  static String infoNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  static String fullDateTime(String date) {
    return DateFormat('EEE, d MM yy | HH:mm').format(DateTime.parse(date));
  }

  static String publish(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (dateTime.isBefore(yesterday)) {
      return fullDateTime(date);
    } else {
      int hour = now.difference(dateTime).inHours;
      if (hour >= 1) {
        return '$hour hour';
      } else {
        int minutes = now.difference(dateTime).inMinutes;
        if (minutes >= 1) {
          return '$minutes minutes';
        } else {
          int seconds = now.difference(dateTime).inSeconds;
          seconds = seconds < 0 ? 1 : seconds;
          return '$seconds seconds';
        }
      }
    }
  }
}