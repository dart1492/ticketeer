// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/auth/data/auth_datasource.dart';
import 'package:ticketeer/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;
  AuthRepositoryImpl({
    required this.datasource,
  });
  @override
  FutureFailable<void> getOTP(String phoneNumber) {
    return RepositoryRequestHandler()(
      request: () => datasource.getOTP(phoneNumber),
      defaultFailure: Failure(
        errorMessage: "We are a bit busy, try later!",
      ),
    );
  }

  @override
  FutureFailable<String> getToken(String otp, String phoneNumber) {
    return RepositoryRequestHandler<String>()(
      request: () => datasource.getToken(otp, phoneNumber),
      defaultFailure: Failure(
        errorMessage: "We are a bit busy, try later!",
      ),
    );
  }
}
