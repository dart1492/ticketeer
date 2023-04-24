import 'package:ticketeer/core/error/request_handler.dart';

/// Token repository that is responsible for interacting with shared prefs to
/// store and retrieve accessToken
abstract class TokenRepository {
  /// Sets the currently active accessToken to the shared prefs
  FutureFailable<void> setToken(String token);

  /// Get currently active token from the shared prefs
  FutureFailable<String?> getToken();
}
