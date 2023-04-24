import 'package:ticketeer/core/error/request_handler.dart';

/// Auth repository for interacting with auth methods of the api
abstract class AuthRepository {
  /// exchange phone number for an otp, sent to the device in a message
  FutureFailable<void> getOTP(String phoneNumber);

  /// Get accessToken in exchange for an otp
  FutureFailable<String> getToken(String otp, String phoneNumber);
}
