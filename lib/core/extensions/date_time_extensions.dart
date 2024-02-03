

import 'package:emi_calculator/core/constants/date_time_format_constants.dart';
import 'package:emi_calculator/i18n/strings.g.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {

  String toStringWithFormat(String format) {
    final DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }

  bool isNotToday() {
    final DateTime today = DateTime.now();

    return today.day != day || today.month != month || today.year != year;
  }

  bool isYesterday() {
    final DateTime today = DateTime.now();
    final DateTime todayDMY = DateTime(today.year, today.month, today.day);
    const Duration twoDay = Duration(days: 1);

    final Duration difference = todayDMY.difference(this);

    if (difference.compareTo(twoDay) < 1) {
      return true;
    }

    return false;
  }

  String toHHMMDDMMYYYYFormat() {
    return DateFormat(DateTimeFormatConstants.hhMMDDMMYYYY).format(this);
  }

  String toDDMMMYYYYFormat(String languageCode) {
    return DateFormat(DateTimeFormatConstants.ddMMMyyyyFormat, languageCode)
        .format(this);
  }

  String todMMMyyyyHHmmFormatEN() {
    return DateFormat(DateTimeFormatConstants.dMMMyyyyHHmmFormatEN)
        .format(this);
  }

  String toYYYYMMDDFormat() {
    return DateFormat(DateTimeFormatConstants.yyyyMMdd).format(this);
  }

  String toyyyyMMddhHHmmFormat() {
    return DateFormat(
      'yyyy/MM/dd HH:mm',
      LocaleSettings.currentLocale.languageCode,
    ).format(this);
  }

  String toTimeHHmmFormatENa() {
    return DateFormat(DateTimeFormatConstants.timeHHmmFormatENa, 'en')
        .format(this);
  }

  String todMMMFormat() {
    return DateFormat(DateTimeFormatConstants.ddMMMFormat, 'en').format(this);
  }

  String toHHmmFormat() {
    return DateFormat(DateTimeFormatConstants.timeHHmmFormatEN, 'en')
        .format(this);
  }

  String toMMMFormat() {
    return DateFormat(
      DateTimeFormatConstants.mMMFormat,
      LocaleSettings.currentLocale.languageCode,
    ).format(this);
  }

  DateTime getDateOnly() => DateTime(year, month, day);
}
