// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

class AppDateFormatter {
  static const String DMMY = 'dd MMMM yyyy';
  static const String HHMMSS = 'hh:mm:ss';
  static const String HHMMSS24 = 'HH:mm:ss';
  static const String HHMMA = 'hh:mm a';
  static const String YearMothDay = 'yyyy/MM/dd';
  static const String DayMothYear = 'dd/MM/yyyy';
  static const String YearMothDayTime = 'yyyy-MM-ddThh:mm:ss';
  static const String MonthDayYear = 'EEE, d LLL yyyy';
  static const String DateAndTime = "EEE, MMM d, h:mm aa";
  static const String DayString = "dd MMM";
  static const String StartDayString = "EEE MMM yyyy ";
  static const String EndDayString = "dd MMM yyyy";
  static const String StartTimeString = "hh:mm aa";

  static DateTime textToDate(String text) {
    try {
      return DateFormat(
        "yyyy-MM-dd hh:mm",
      ).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String textTFormate(String text, String formate, [String? local]) {
    try {
      final DateFormat format = DateFormat(formate, local);
      return format.format(DateFormat("yyyy-MM-dd hh:mm").parse(text));
    } catch (_) {
      return '';
    }
  }

  static String dateToFormate(
    DateTime time,
    String formate,
  ) {
    try {
      final DateFormat format = DateFormat(formate);
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static String dateStringToFormate(
    String time,
    String formate,
  ) {
    try {
      final DateFormat format = DateFormat(formate);
      return format.format(DateTime.parse(time));
    } catch (_) {
      return time;
    }
  }

  static String dateToString(DateTime time) {
    try {
      final DateFormat format = DateFormat('dd/MM/yyyy');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }


  static String convertDate(DateTime time) {
    try {
      final DateFormat format = DateFormat('yyyy-MM-dd – kk:mm');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static DateTime textToTime(String text, String lang) {
    try {
      return DateFormat("hh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String formateTime(String text) {
    try {
      DateTime time = DateFormat(AppDateFormatter.HHMMSS).parse(text);
      return DateFormat(AppDateFormatter.HHMMA).format(time);
    } catch (_) {
      return '';
    }
  }

  static DateTime formateStringToDateTime(
    String text,
  ) {
    try {
      DateTime time = DateFormat(AppDateFormatter.HHMMA).parse(text);
      return time;
    } catch (_) {
      return DateTime.now();
    }
  }

  static today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String formatDateToMonthAndDay(String date){
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMMM.dd').format(dateTime);
  }

  static String formatDateToHoursAndMinutes(String date){
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('hh:mm a').format(dateTime);
  }

  static bool isExceeding12Hours(String dateTimeString) {
    DateTime inputDateTime = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(inputDateTime);
    return difference.inHours > 12;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
