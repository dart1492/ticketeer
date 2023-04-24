import 'package:ticketeer/features/auth/data/auth_datasource.dart';
import 'package:ticketeer/features/auth/data/auth_repository_impl.dart';
import 'package:ticketeer/features/auth/domain/repositories/auth_repository.dart';
import 'package:ticketeer/features/auth/presentation/cubits/cubit/phone_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Sets up dependencies for authorization
void authDependencyInjection() {
  sl.registerLazySingleton<AuthDatasource>(
    () => AuthDatasourceImpl(
      dio: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      datasource: sl(),
    ),
  );

  sl.registerFactory(
    () => AuthCubit(
      authRepo: sl(),
      tokenRepo: sl(),
    ),
  );
}
