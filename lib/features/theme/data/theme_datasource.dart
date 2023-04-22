import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDatasource {
  Future<String?> getCurrentTheme();
  Future<void> setNewTheme(String newTheme);
}

class ThemeDatasourceImpl extends ThemeDatasource {
  // Instance of the sharedPreferences,
  //should be given to the constructor through getIt
  final SharedPreferences sp;

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
