// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_void_async
import 'package:dio/dio.dart';
import 'package:ticketeer/core/constants/object_constants.dart';

import 'package:ticketeer/features/localization/domain/localization_repository.dart';

/// Dio interceptor for all api calls. It is used to provide bearer tokens and
/// locales the server. Repositories for them are injected

class ApiInterceptor extends Interceptor {
  final LocalizationRepository localeRepo;
  ApiInterceptor({
    required this.localeRepo,
  });
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //TODO: Decide in which format server accepts localization
    String localeToSend = startLocale.languageCode;
    final result = await localeRepo.getCurrentLocale();
    result.fold(
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

    options.headers['Content-Language:'] = localeToSend;

    super.onRequest(options, handler);
  }
}
