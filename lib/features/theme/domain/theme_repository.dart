import 'package:ticketeer/core/error/request_handler.dart';

/// abstract theme repository class
abstract class ThemeRepository {
  /// get theme, stored in "theme" variable in the shared prefs
  FutureFailable<String?> getCurrentTheme();

  /// set new theme to be stored in "theme" variable in the shared prefs

  FutureFailable<void> setNewTheme(String newTheme);
}
