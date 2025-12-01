import 'package:intl/intl.dart';

extension StringDateFormatter on String {
  /// Formats a date string (ISO 8601) into any custom format.
  ///
  /// Example:
  /// "2025-12-01T21:46:06.219825".formatDate("MM dd, yyyy")
  /// → "12 01, 2025"
  String formatDate(String pattern) {
    try {
      final DateTime parsed = DateTime.parse(this);
      return DateFormat(pattern).format(parsed);
    } catch (_) {
      return this; // fallback if invalid date string
    }
  }
}
