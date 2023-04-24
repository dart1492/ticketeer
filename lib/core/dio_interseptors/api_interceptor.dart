// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_void_async
import 'package:dio/dio.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/features/auth/domain/repositories/token_repository.dart';

import 'package:ticketeer/features/localization/domain/localization_repository.dart';

/// Dio interceptor for all api calls. It is used to provide bearer tokens and
/// locales the server. Repositories for them are injected

class ApiInterceptor extends Interceptor {
  final LocalizationRepository localeRepo;
  final TokenRepository tokenRepo;
  ApiInterceptor({
    required this.localeRepo,
    required this.tokenRepo,
  });
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String localeToSend = startLocale.languageCode;
    final localeResult = await localeRepo.getCurrentLocale();
    localeResult.fold(
      (l) {},
      (r) {
        // if it is the first time setting locale
        if (r == null) {
          localeRepo.setNewLocale(startLocale);
        } else {
          localeToSend = r.languageCode;
        }
      },
    );

    options.headers['Accept-Language'] = localeToSend;

    final tokenResult = await tokenRepo.getToken();
    tokenResult.fold((l) {
      //  if we couldn't get the token just send an empty header
    }, (r) {
      options.headers['Authorization: Bearer '] = r;
    });

    super.onRequest(options, handler);
  }
}
