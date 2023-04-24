// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/auth/data/token_datasource.dart';
import 'package:ticketeer/features/auth/domain/repositories/token_repository.dart';

class TokenRepositoryImpl extends TokenRepository {
  final TokenDatasource datasource;
  TokenRepositoryImpl({
    required this.datasource,
  });
  @override
  FutureFailable<String?> getToken() {
    return RepositoryRequestHandler<String?>()(
      request: () => datasource.getToken(),
      defaultFailure: Failure(errorMessage: "couldn't get the token"),
    );
  }

  @override
  FutureFailable<void> setToken(String token) {
    return RepositoryRequestHandler<void>()(
      request: () => datasource.setToken(token),
      defaultFailure: Failure(errorMessage: "couldn't get the token"),
    );
  }
}
