// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

/// Interacts with shared prefs directly to store and get accessToken
abstract class TokenDatasource {
  /// Get token
  Future<String?> getToken();

  /// Set token
  Future<void> setToken(String token);
}

class TokenDatasourceImpl extends TokenDatasource {
  final SharedPreferences sp;
  TokenDatasourceImpl({
    required this.sp,
  });

  @override
  Future<String?> getToken() async {
    return sp.getString("accessToken");
  }

  @override
  Future<void> setToken(String token) async {
    await sp.setString("accessToken", token);
  }
}
