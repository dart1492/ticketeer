import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/profile/domain/entities/user.dart';

/// Repository for interacting with user related apis
abstract class ProfileRepository {
  /// Get user object
  FutureFailable<User> getUser();

  /// Change username
  FutureFailable<void> changeUsername(String newUsername);
}
