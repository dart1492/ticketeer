/// Class for interacting with DAteTime objects, and everything, related to it
class DateTimeHelper {
  /// Map mont numbers to their short name analogs in localization paths
  static final Map<int, String> _monthsShortDict = {
    1: 'months_short.1',
    2: 'months_short.2',
    3: 'months_short.3',
    4: 'months_short.4',
    5: 'months_short.5',
    6: 'months_short.6',
    7: 'months_short.7',
    8: 'months_short.8',
    9: 'months_short.9',
    10: 'months_short.10',
    11: 'months_short.11',
    12: 'months_short.12',
  };

  /// Map of long month names
  static final Map<int, String> _monthsFullDict = {
    1: 'months_full.1',
    2: 'months_full.2',
    3: 'months_full.3',
    4: 'months_full.4',
    5: 'months_full.5',
    6: 'months_full.6',
    7: 'months_full.7',
    8: 'months_full.8',
    9: 'months_full.9',
    10: 'months_full.10',
    11: 'months_full.11',
    12: 'months_full.12',
  };

  /// Convert month number into a short string form
  static String monthToShortString(int month) {
    return _monthsShortDict[month] ?? '';
  }

  /// Convert month int to a full name
  static String monthToFullString(int month) {
    return _monthsFullDict[month] ?? '';
  }

  /// Format DateTime object to sent to an API
  static String formatDateTime(DateTime dateTime) {
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String year = dateTime.year.toString();

    return '$year-$month-$day';
  }
}
