import 'package:shared_preferences/shared_preferences.dart';

/// Abstract theme datasource that defines operations for theme feature
abstract class ThemeDatasource {
  /// Async operation to get the current theme variable - returns null
  /// if the variable is not stored
  Future<String?> getCurrentTheme();

  /// Async operation - can be unawaited.
  /// Sets the "theme" variable into SharedPreferences storage
  Future<void> setNewTheme(String newTheme);
}

/// Implementation of the abstract datasource.
/// Needs instance of SharedPreferences to preform actions
class ThemeDatasourceImpl extends ThemeDatasource {
  /// Instance of the sharedPreferences,
  /// should be given to the constructor through getIt (or any di actually)
  final SharedPreferences sp;

  /// Implementation of the abstract datasource.
  /// Needs instance of SharedPreferences to preform actions
  ThemeDatasourceImpl(this.sp);

  @override
  Future<String?> getCurrentTheme() async {
    return sp.getString('theme');
  }

  @override
  Future<void> setNewTheme(String newTheme) async {
    await sp.setString('theme', newTheme);
  }
}
