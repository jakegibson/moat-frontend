import 'package:intl/intl.dart';

class DateFormatter {
  static DateFormat dateFormat = DateFormat('MMMM dd, yyyy');
  static DateFormat dateTimeFormat = DateFormat('MMMM dd, yyyy h:mm a');

  static String formatFriendlyDate({
    required DateTime dateTime,
    bool short = false,
  }) {
    if (short) {
      return DateFormat.yMMMd().format(dateTime);
    }
    return dateFormat.format(dateTime);
  }

  static String formatFriendlyDateTime({required DateTime dateTime}) {
    return dateTimeFormat.format(dateTime);
  }

  static String formatFriendlyTimestamp({
    required DateTime timestamp,
    bool isUtc = true,
  }) {
    return formatFriendlyDateTime(dateTime: timestamp);
  }

  static String formatFriendlyTimestampJustDate({
    required DateTime timestamp,
    bool short = false,
    isUtc = true,
  }) {
    return formatFriendlyDate(dateTime: timestamp, short: short);
  }

  static DateTime timestampToDateTime({required DateTime timestamp}) {
    return timestamp;
  }

  static DateTime dateTimeToTimestamp({required DateTime dateTime}) {
    return dateTime;
  }

  static String formatWarrantyExpiration({
    DateTime? expirationDate,
    int? expirationInMonths,
    bool short = false,
  }) {
    // Check for lifetime warranty (999 months convention)
    if (expirationInMonths == 999) {
      return 'Lifetime';
    }

    // If no expiration date, return default message
    if (expirationDate == null) {
      return 'No expiration';
    }

    // Format the date based on short parameter
    return formatFriendlyDate(dateTime: expirationDate, short: short);
  }
}
