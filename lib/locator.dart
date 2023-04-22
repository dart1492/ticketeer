import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketeer/core/routing/app_router.dart';

import 'package:ticketeer/features/theme/cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/data/theme_datasource.dart';

/// Global variable, used throughout the app for dependency injection
final sl = GetIt.instance;

/// Setup locator function - registers all dependencies,
///  needed on the start of this app (including async calls)
Future<void> setupLocator() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  sl.registerSingleton<ThemeDatasource>(ThemeDatasourceImpl(sl()));

  sl.registerFactory(() => ThemeCubit(sl()));
}
