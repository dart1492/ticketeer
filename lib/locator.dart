import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/dio_interseptors/api_interceptor.dart';
import 'package:ticketeer/core/routing/app_router.dart';
import 'package:ticketeer/features/auth/data/token_datasource.dart';
import 'package:ticketeer/features/auth/data/token_repository_impl.dart';
import 'package:ticketeer/features/auth/domain/repositories/token_repository.dart';
import 'package:ticketeer/features/auth/injection.dart';
import 'package:ticketeer/features/localization/data/localization_datasource.dart';
import 'package:ticketeer/features/localization/data/localization_repository_impl.dart';
import 'package:ticketeer/features/localization/domain/localization_repository.dart';
import 'package:ticketeer/features/profile/injection.dart';
import 'package:ticketeer/features/theme/injection.dart';

/// Global variable, used throughout the app for dependency injection
final sl = GetIt.instance;

/// Setup locator function - registers all dependencies,
///  needed on the start of this app (including async calls)
Future<void> setupLocator() async {
  sl.registerSingleton<Logger>(Logger());

  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<TokenDatasource>(
    TokenDatasourceImpl(
      sp: sl(),
    ),
  );

  sl.registerSingleton<TokenRepository>(
    TokenRepositoryImpl(
      datasource: sl(),
    ),
  );

  sl.registerSingleton<LocalizationDatasource>(
    LocalizationDatasourceImpl(
      sl(),
    ),
  );

  sl.registerSingleton<LocalizationRepository>(
    LocalizationRepositoryImpl(
      sl(),
    ),
  );

  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: baseUrl),
    )..interceptors.add(
        ApiInterceptor(
          localeRepo: sl(),
          tokenRepo: sl(),
        ),
      ),
  );

  themeDependencyInjection();
  authDependencyInjection();
  profileDependencyInjection();
}
