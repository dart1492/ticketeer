/// Class for interacting with DAteTime objects, and everything, related to it
class DateTimeHelper {
  /// Map mont numbers to their short name analogs in localization paths
  static final Map<int, String> _monthsDict = {
    1: 'months.1',
    2: 'months.2',
    3: 'months.3',
    4: 'months.4',
    5: 'months.5',
    6: 'months.6',
    7: 'months.7',
    8: 'months.8',
    9: 'months.9',
    10: 'months.10',
    11: 'months.11',
    12: 'months.12',
  };

  /// Convert month number into a short string form
  static String monthToShortString(int month) {
    return _monthsDict[month] ?? '';
  }
}
