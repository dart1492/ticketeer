// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ticketeer/locator.dart';

/// Datasource, implementation of which interacts with auth api
abstract class AuthDatasource {
  /// exchange phone number for an otp, sent to the device in a message.
  /// IF the result "success" var is true - than its okay.
  /// If it is false - throw an exception that then converts into a Failure
  Future<void> getOTP(String phoneNumber);

  /// Get accessToken in exchange for an otp
  Future<String> getToken(String otp, String phoneNumber);
}

class AuthDatasourceImpl extends AuthDatasource {
  Dio dio;
  AuthDatasourceImpl({
    required this.dio,
  });

  @override
  Future<void> getOTP(String phoneNumber) async {
    final result = await dio.post(
      "/api/auth/otp",
      data: {
        "phoneNumber": phoneNumber,
      },
    );

    if ((result.data as Map<String, dynamic>)['success'] == false) {
      throw Exception();
    }
  }

  @override
  Future<String> getToken(String otp, String phoneNumber) async {
    sl<Logger>().i(otp);
    final result = await dio.post(
      "/api/auth/login",
      data: {
        "phoneNumber": phoneNumber,
        "otp": otp,
      },
    );

    final resultMap = result.data as Map<String, dynamic>;
    if (resultMap['success'] == true) {
      // ignore: avoid_dynamic_calls
      sl<Logger>().i(resultMap['data']['accessToken'] as String);

      // ignore: avoid_dynamic_calls
      return resultMap['data']['accessToken'] as String;
    } else {
      throw Exception("Error: try again later");
    }
  }
}
