import 'package:system_theme/system_theme.dart';

/// Wrapper to perform dependency inversion for SystemTheme package
class CustomSystemTheme {
  /// Returns true if the system mode is dark, false - otherwise
  static bool get isDarkMode => SystemTheme.isDarkMode;
}
